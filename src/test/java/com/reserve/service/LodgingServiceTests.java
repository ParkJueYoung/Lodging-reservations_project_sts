package com.reserve.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.reserve.model.Criteria;
import com.reserve.model.LodgingVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class LodgingServiceTests {
	
	@Autowired
	LodgingService service;
	
//	@Test
//	public void getCateInfoListTest1() {
//		Criteria cri = new Criteria();
//	
//		String type = "TC";
//		String keyword = "없음";	
//		String cateCode="111";
//
//		cri.setType(type);
//		cri.setKeyword(keyword);
//		cri.setCateCode(cateCode);
//		
//		System.out.println("List<CateFilterDTO> : " + service.getCateInfoList(cri));
//		
//	}
//	
//	@Test
//	public void getCateInfoListTest2() {
//		Criteria cri = new Criteria();
//	
//		String type = "AC";
//		String keyword = "유홍준";	
//		String cateCode = "111";
//
//		cri.setType(type);
//		cri.setKeyword(keyword);
//		cri.setCateCode(cateCode);
//		
//		System.out.println("List<CateFilterDTO> : " + service.getCateInfoList(cri));
//		
//	}	
//
//	@Test
//	public void getCateInfoListTest3() {
//		Criteria cri = new Criteria();
//	
//		String type = "T";
//		String keyword = "테스트";
//		
//
//		cri.setType(type);
//		cri.setKeyword(keyword);
//		
//		System.out.println("List<CateFilterDTO> : " + service.getCateInfoList(cri));
//		
//	}	
//	
//	@Test
//	public void getCateInfoListTest4() {
//		Criteria cri = new Criteria();
//	
//		String type = "AC";
//		String keyword = "머스크";	
//		
//
//		cri.setType(type);
//		cri.setKeyword(keyword);
//		
//		System.out.println("List<CateFilterDTO> : " + service.getCateInfoList(cri));
//		
//	}
	
	/*숙소 상세 정보*/
	@Test
	public void getLodgingInfoTest() {
		
		int lodgingId = 2;
		
		LodgingVO lodgingInfo = service.getLodgingInfo(lodgingId);
		
		System.out.println("==결과==");
		System.out.println("전체 : " + lodgingInfo);
		System.out.println("lodgingId : " + lodgingInfo.getLodgingId() );
		System.out.println("이미지 정보 : " + lodgingInfo.getImageList().isEmpty());
		
		
	}
	
}
