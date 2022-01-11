package com.reserve.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.reserve.mapper.AttachMapper;
import com.reserve.model.AttachImageVO;
import com.reserve.model.Criteria;
import com.reserve.model.LodgingVO;
import com.reserve.model.PageDTO;
import com.reserve.service.LodgingService;

@Controller
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	private AttachMapper attachMapper;
	
	@Autowired
	private LodgingService lodgingService;

	// 메인 페이지 이동
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void mainPageGET(Model model) {
		logger.info("메인 페이지 진입");
		
		model.addAttribute("cate1", lodgingService.getCateCode1());
		model.addAttribute("cate2", lodgingService.getCateCode2());
	}

	// 이미지 출력
	@GetMapping("/display")
	public ResponseEntity<byte[]> getImage(String fileName) {

		logger.info("getImage()........." + fileName);

		File file = new File("C:\\upload\\" + fileName);

		ResponseEntity<byte[]> result = null;

		try {

			HttpHeaders header = new HttpHeaders();

			header.add("Content-type", Files.probeContentType(file.toPath()));

			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);

		} catch (IOException e) {
			e.printStackTrace();
		}

		return result;
	}
	
	/* 이미지 정보 반환 */
	@GetMapping(value="/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<AttachImageVO>> getAttachList(int lodgingId){
		
		logger.info("getAttachList.........." + lodgingId);
		
		return new ResponseEntity<List<AttachImageVO>>(attachMapper.getAttachList(lodgingId), HttpStatus.OK);
		
	}
	
	/* 상품 검색 */
	@GetMapping("search")
	public String searchLodgingGET(Criteria cri, Model model) {
		
		logger.info("cri : " + cri);
		
		List<LodgingVO> list = lodgingService.getLodgingList(cri);
		logger.info("pre list : " + list);
		if(!list.isEmpty()) {
			model.addAttribute("list", list);
			logger.info("list : " + list);
		} else {
			model.addAttribute("listcheck", "empty");
			
			return "search";
		}
		
		model.addAttribute("pageMaker", new PageDTO(cri, lodgingService.lodgingGetTotal(cri)));
		
		String[] typeArr = cri.getType().split("");
		
			for(String s : typeArr) {
				if(s.equals("T") || s.equals("A")) {
					model.addAttribute("filter_info", lodgingService.getCateInfoList(cri));		
				}
			}
		
		
		return "search";
		
	}
	
	/* 숙소 상세 */
	@GetMapping("/lodgingDetail/{lodgingId}")
	public String goodsDetailGET(@PathVariable("lodgingId")int lodgingId, Model model) {
		
		logger.info("lodgingDetailGET()..........");
		
		model.addAttribute("lodgingInfo", lodgingService.getLodgingInfo(lodgingId));
		
		return "/lodgingDetail";
	}
	
}
