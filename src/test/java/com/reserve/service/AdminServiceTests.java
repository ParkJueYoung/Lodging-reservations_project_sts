package com.reserve.service;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.reserve.model.AttachImageVO;
import com.reserve.model.LodgingVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class AdminServiceTests {

	@Autowired
	private AdminService service;
	
	@Test
	public void lodgingEnrollTEsts() {
		LodgingVO lodging = new LodgingVO();
		// 숙소 정보
		lodging.setLodgingName("service 테스트2");
		lodging.setLeaseId(5);
		lodging.setCateCode("110");
		lodging.setLodgingPrice(20000);
		lodging.setLodgingStock(300);
		lodging.setLodgingIntro("숙소 소개2 ");
		lodging.setLodgingContents("숙소 내용2 ");

		// 이미지 정보
		List<AttachImageVO> imageList = new ArrayList<AttachImageVO>(); 
		
		AttachImageVO image1 = new AttachImageVO();
		AttachImageVO image2 = new AttachImageVO();
		
		image1.setFileName("test Image 1");
		image1.setUploadPath("test image 1");
		image1.setUuid("test1111");
		
		image2.setFileName("test Image 2");
		image2.setUploadPath("test image 2");
		image2.setUuid("test2222");
		
		imageList.add(image1);
		imageList.add(image2);
		
		
		// lodgingEnroll() 메서드 호출
		service.lodgingEnroll(lodging);
		
		System.out.println("등록된 VO : " + lodging);
		
		
	}
	
}
