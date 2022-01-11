package com.reserve.controller;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.reserve.model.AttachImageVO;
import com.reserve.model.Criteria;
import com.reserve.model.LeaseVO;
import com.reserve.model.LodgingVO;
import com.reserve.model.PageDTO;
import com.reserve.model.ReserveCancelDTO;
import com.reserve.model.ReserveDTO;
import com.reserve.service.AdminService;
import com.reserve.service.LeaseService;
import com.reserve.service.ReserveService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Autowired
	private LeaseService leaseService;

	@Autowired
	private AdminService adminService;
	
	@Autowired
	private ReserveService reserveService;

	// 관리자 메인 페이지 이동
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public void adminMainGET() throws Exception {

		logger.info("관리자 페이지 이동");
	}

	// 임대인 등록 페이지 접속
	@RequestMapping(value = "leaseEnroll", method = RequestMethod.GET)
	public void leaseEnrollGET() throws Exception {

		logger.info("임대인 등록 페이지 접속");

	}

	// 임대인 목록 페이지 접속
	@RequestMapping(value = "leaseList", method = RequestMethod.GET)
	public void leaseListGET(Criteria cri, Model model) throws Exception {
		logger.info("임대인 목록 페이지 접속.........." + cri);

		// 임대인 목록 출력 데이터
		List list = leaseService.leaseGetList(cri);

		if (!list.isEmpty()) {
			model.addAttribute("list", list); // 존재 경우
		} else {
			model.addAttribute("listCheck", "empty"); // 존재하지 않을 경우
		}

		// 페이지 이동 인터페이스 데이터
		model.addAttribute("pageMaker", new PageDTO(cri, leaseService.leaseGetTotal(cri)));
	}

	// 숙소 등록 페이지 접속
	@RequestMapping(value = "lodgingEnroll", method = RequestMethod.GET)
	public void lodgingEnrollGET(Model model) throws Exception {

		logger.info("숙소 등록 페이지 접속");

		ObjectMapper objm = new ObjectMapper();

		List list = adminService.cateList();

		String cateList = objm.writeValueAsString(list);

		model.addAttribute("cateList", cateList);

//    	logger.info("변경 전......" + list);
//    	logger.info("변경 후......" + cateList);

	}

	// 숙소 목록 페이지 접속
	@RequestMapping(value = "lodgingList", method = RequestMethod.GET)
	public void lodgingLISTGET(Criteria cri, Model model) throws Exception {

		logger.info("숙소 관리 페이지 접속");

		List list = adminService.lodgingGetList(cri);

		if (!list.isEmpty()) {
			model.addAttribute("list", list);
		} else {
			model.addAttribute("listCheck", "empty");
			return;
		}

		// 페이지 인터페이스 데이터
		model.addAttribute("pageMaker", new PageDTO(cri, adminService.lodgingGetTotal(cri)));

	}

	// 숙소 상세 조회 페이지
	@GetMapping({ "/lodgingDetail", "lodgingModify" }) // 도메인에 노출
	public void lodgingGetInfoGET(int lodgingId, Criteria cri, Model model) throws JsonProcessingException {

		logger.info("lodgingGetInfo()........" + lodgingId);

		ObjectMapper mapper = new ObjectMapper();

		/* 카테고리 리스트 데이터 */
		model.addAttribute("cateList", mapper.writeValueAsString(adminService.cateList()));

		// 목록 페이지 조건 정보
		model.addAttribute("cri", cri);

		// 조회 페이지 정보
		model.addAttribute("lodgingInfo", adminService.lodgingGetDetail(lodgingId));
	}

	// 숙소 정보 수정
	@PostMapping("/lodgingModify") // 패킷안에 숨어서 전송 도메인에 노출 X
	public String lodgingModifyPOST(LodgingVO vo, RedirectAttributes rttr) {

		logger.info("lodgingModifyPOST.........." + vo);

		int result = adminService.lodgingModify(vo);

		rttr.addFlashAttribute("modify_result", result);

		return "redirect:/admin/lodgingList";

	}

	// 숙소 정보 삭제
	@PostMapping("/lodgingDelete")
	public String lodgingDeletePOST(int lodgingId, RedirectAttributes rttr) {

		logger.info("lodgingDeletePOST..........");

		List<AttachImageVO> fileList = adminService.getAttachInfo(lodgingId);

		if (fileList != null) {

			List<Path> pathList = new ArrayList();

			fileList.forEach(vo -> {

				// 원본 이미지
				Path path = Paths.get("C:\\upload", vo.getUploadPath(), vo.getUuid() + "_" + vo.getFileName());
				pathList.add(path);

				// 섬네일 이미지
				path = Paths.get("C:\\upload", vo.getUploadPath(), "s_" + vo.getUuid() + "_" + vo.getFileName());
				pathList.add(path);

			});

			pathList.forEach(path -> {
				path.toFile().delete();
			});

		}

		int result = adminService.lodgingDelete(lodgingId);

		rttr.addFlashAttribute("delete_result", result);

		return "redirect:/admin/lodgingList";
	}

	// 임대인 등록
	@RequestMapping(value = "leaseEnroll.do", method = RequestMethod.POST)
	public String leaseEnrollPOST(LeaseVO lease, RedirectAttributes rttr) throws Exception {
		logger.info("leaseEnroll :" + lease);

		leaseService.leaseEnroll(lease);
		rttr.addFlashAttribute("enroll_result", lease.getLeaseName());
		return "redirect:/admin/leaseList";
	}

	// 임대인 상세 페이지
	@GetMapping({ "/leaseDetail", "/leaseModify" })
	public void leaseGetInfoGET(int leaseId, Criteria cri, Model model) throws Exception {

		logger.info("leaseDetail......." + leaseId);

		/* 임대인 관리 페이지 정보 */
		model.addAttribute("cri", cri);

		/* 선택 임대인 정보 */
		model.addAttribute("leaseInfo", leaseService.leaseGetDetail(leaseId));

	}

	// 임대인 정보 수정
	@PostMapping("/leaseModify")
	public String leaseModifyPOST(LeaseVO lease, RedirectAttributes rttr) throws Exception {

		logger.info("leaseModifyPOST......." + lease);

		int result = leaseService.leaseModify(lease);

		rttr.addFlashAttribute("modify_result", result);

		return "redirect:/admin/leaseList";

	}

	// 임대인 정보 삭제
	@PostMapping("/leaseDelete")
	public String leaseDeletePOST(int leaseId, RedirectAttributes rttr) {

		logger.info("leaseDeletePOST........");

		int result = 0;

		try {

			result = leaseService.leaseDelete(leaseId);

		} catch (Exception e) {

			e.printStackTrace();
			result = 2;
			rttr.addFlashAttribute("delete_result", result);

			return "redirect:/admin/leaseList";

		}

		rttr.addFlashAttribute("delete_result", result);

		return "redirect:/admin/leaseList";

	}

	// 숙소 등록
	@PostMapping("/lodgingEnroll")
	public String lodgingEnrollPOST(LodgingVO lodging, RedirectAttributes rttr) {

		logger.info("lodgingEnrollPOST.........." + lodging);

		adminService.lodgingEnroll(lodging);

		rttr.addFlashAttribute("enroll_result", lodging.getLodgingName());

		return "redirect:/admin/lodgingList";

	}

	// 임대인 찾기
	@GetMapping("/leasePop")
	public void leasePopGET(Criteria cri, Model model) throws Exception {

		logger.info("leasePopGET........");

		cri.setAmount(5);

		// 숙소 출력 데이터
		List list = leaseService.leaseGetList(cri);

		if (!list.isEmpty()) {
			model.addAttribute("list", list); // 임대인 존재 o
		} else {
			model.addAttribute("listcheck", "empty"); // 임대인 존재 x
		}

		// 페이지 이동 인터페이스 데이터
		model.addAttribute("pageMaker", new PageDTO(cri, leaseService.leaseGetTotal(cri)));

	}

	// 첨부파일 업로드
	@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<AttachImageVO>> uploadAjaxActionPOST(MultipartFile[] uploadFile) {

		logger.info("uploadAjaxActionPOST.........");

		/* 이미지 파일 체크 */
		for (MultipartFile multipartFile : uploadFile) {

			File checkfile = new File(multipartFile.getOriginalFilename());
			String type = null;

			try {
				type = Files.probeContentType(checkfile.toPath());
				logger.info("MIME TYPE : " + type);
			} catch (IOException e) {
				e.printStackTrace();
			}

			if (!type.startsWith("image")) {

				List<AttachImageVO> list = null;
				return new ResponseEntity<>(list, HttpStatus.BAD_REQUEST);

			}

		}

		String uploadFolder = "C:\\upload";

		// 날짜 폴더 경로
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Date date = new Date();

		String str = sdf.format(date);

		String datePath = str.replace("-", File.separator);

		/* 폴더 생성 */
		File uploadPath = new File(uploadFolder, datePath);

		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}

		List<AttachImageVO> list = new ArrayList();

		// 향상된 for
		for (MultipartFile multipartFile : uploadFile) {

			// 이미지 정보 삭제
			AttachImageVO vo = new AttachImageVO();

			/* 파일 이름 */
			String uploadFileName = multipartFile.getOriginalFilename();
			vo.setFileName(uploadFileName);
			vo.setUploadPath(datePath);

			/* uuid 적용 파일 이름 */
			String uuid = UUID.randomUUID().toString();
			vo.setUuid(uuid);

			uploadFileName = uuid + "_" + uploadFileName;

			/* 파일 위치, 파일 이름을 합친 File 객체 */
			File saveFile = new File(uploadPath, uploadFileName);

			/* 파일 저장 */
			try {
				multipartFile.transferTo(saveFile);

				File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);

				BufferedImage bo_image = ImageIO.read(saveFile);
				/* 비율 */
				double ratio = 3;
				/* 넓이 높이 */
				int width = (int) (bo_image.getWidth() / ratio);
				int height = (int) (bo_image.getHeight() / ratio);

				BufferedImage bt_image = new BufferedImage(width, height, BufferedImage.TYPE_3BYTE_BGR);

				Graphics2D graphic = bt_image.createGraphics();

				graphic.drawImage(bo_image, 0, 0, width, height, null);

				ImageIO.write(bt_image, "jpg", thumbnailFile);

			} catch (Exception e) {
				e.printStackTrace();
			}
			list.add(vo);
		}
		ResponseEntity<List<AttachImageVO>> result = new ResponseEntity<List<AttachImageVO>>(list, HttpStatus.OK);

		return result;
	}

	// 이미지 파일 삭제
	@PostMapping("/deleteFile")
	public ResponseEntity<String> deleteFile(String fileName) {

		logger.info("deleteFile.........." + fileName);

		File file = null;

		try {
			/* 썸네일 파일 삭제 */
			file = new File("c:\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));

			file.delete();

			/* 원본 파일 삭제 */
			String originFileName = file.getAbsolutePath().replace("s_", "");

			logger.info("originFileName : " + originFileName);

			file = new File(originFileName);

			file.delete();

		} catch (Exception e) {

			e.printStackTrace();

			return new ResponseEntity<String>("fail", HttpStatus.NOT_IMPLEMENTED);

		}

		return new ResponseEntity<String>("success", HttpStatus.OK);

	}

	// 예약 현황 페이지
	@GetMapping("/reserveList")
	public String reserveListGET(Criteria cri, Model model) {

		List<ReserveDTO> list = adminService.getReserveList(cri);

		if (!list.isEmpty()) {
			model.addAttribute("list", list);
			model.addAttribute("pageMaker", new PageDTO(cri, adminService.getReserveTotal(cri)));
		} else {
			model.addAttribute("listCheck", "empty");
		}

		return "admin/reserveList";
	}

	@PostMapping("/reserveCancel")
	public String reserveCancelPOST(ReserveCancelDTO dto) {
	
		reserveService.reserveCancel(dto);
		
		return "redirect:/admin/reserveList?keyword=" + dto.getKeyword() + "&amount=" + dto.getAmount() + "&pageNum" + dto.getPageNum();
		
	}
	
}
