package com.reserve.mapper;


import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.reserve.model.AttachImageVO;
import com.reserve.model.Criteria;
import com.reserve.model.LodgingVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class AdminMapperTests {
	
	@Autowired
	private AdminMapper mapper;
	
	// 숙소 등록
//	@Test
//	public void lodgingEnrollTest() throws Exception{
//		
//		LodgingVO lodging = new LodgingVO();
//		
//		lodging.setLodgingName("mapper 테스트");
//		lodging.setLeaseId(123);
//		lodging.setCateCode("121");
//		lodging.setLodgingPrice(200000);
//		lodging.setLodgingStock(2);
//		lodging.setLodgingIntro("숙소 소개");
//		lodging.setLodgingContents("숙소 구비물");
//		
//		System.out.println("Before lodgingVO : " + lodging);
//		
//		mapper.lodgingEnroll(lodging);
//		
//		System.out.println("After lodgingVO : " + lodging);
//		
//	}
	
//	@Test
//	public void cateListTest() throws Exception{
//		
//		System.out.println("cateList().........." + mapper.cateList());
//		
//	}
	
	/* 숙소 리스트 & 숙소 총 갯수 */
//	@Test
//	public void lodgingGetListTest() {
//		
//		Criteria cri = new Criteria();
//		
//		/* 검색조건 */
//		cri.setKeyword("테스트");
//		
//		/* 검색 리스트 */
//		List list = mapper.lodgingGetList(cri);
//		for(int i = 0; i < list.size(); i++) {
//			System.out.println("result......." + i + " : " + list.get(i));
//		}
//		
//		/* 숙소 총 갯수 */
//		int result = mapper.lodgingGetTotal(cri);
//		System.out.println("resutl.........." + result);
//		
//		
//	}
	
	/* 숙소 조회 페이지 */
//	@Test
//	public void lodgingGetDetailTest() {
//		
//		int lodgingId = 3;
//		
//		LodgingVO result = mapper.lodgingGetDetail(lodgingId);
//		
//		System.out.println("숙소 조회 데이터 : " + result);
//		
//		
//	}
	
	// 숙소 정보 수정
//	@Test
//	public void lodgingModifyTest() {
//		
//		LodgingVO lodging = new LodgingVO();
//		
//		lodging.setLodgingId(1);
//		lodging.setLodgingName("mapper 테스트2");
//		lodging.setLeaseId(2);
//		lodging.setCateCode("211");
//		lodging.setLodgingPrice(2000);
//		lodging.setLodgingStock(30);
//		lodging.setLodgingIntro("숙소 소개 ");
//		lodging.setLodgingContents("숙소 내용 ");
//		
//		mapper.lodgingModify(lodging);
//	}

	
	// 숙소 정보 삭제
//	@Test
//	public void lodgingDelete() {
//		
//		int lodgingId = 5;
//		
//		int result = mapper.lodgingDelete(lodgingId);
//		
//		if(result == 1) {
//			System.out.println("삭제 성공");
//		}
//	}
	// 이미지 등록
//	@Test
//	public void imageEnrollTest() {
//		
//		AttachImageVO vo = new AttachImageVO();
//		
//		vo.setLodgingId(1);
//		vo.setFileName("test");
//		vo.setUploadPath("test");
//		vo.setUuid("test");
//		
//		mapper.imageEnroll(vo);
//		
//	}
	
	// 지정 숙소 이미지 삭제
//	@Test
//	public void deleteImageAllTest() {
//		
//		int lodgingId = 16;
//		
//		mapper.deleteImageAll(lodgingId);
//	}
	
	// 어제 날짜 이미지 리스트
//	@Test
//	public void checkImageListTest() {
//		
//		mapper.checkFileList();
//		
//		
//	}
	
	// 지정 숙소 이미지 정보 얻기
	@Test
	public void getAttachInfoTest() {
		
		int lodgingId = 15;
		
		List<AttachImageVO> list = mapper.getAttachInfo(lodgingId);
		
		System.out.println("list : " + list);
		
	}
	
}
