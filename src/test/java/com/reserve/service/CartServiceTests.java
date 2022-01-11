package com.reserve.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.reserve.model.CartDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class CartServiceTests {
	
	@Autowired
	private CartService service;
	
	@Test
	public void addCartTest() {
		
		String memberId = "admin123";
		int lodgingId = 16;
		int count = 3;
		
		CartDTO dto = new CartDTO();
		dto.setMemberId(memberId);
		dto.setLodgingId(lodgingId);
		dto.setLodgingCount(count);
		
		int result = service.addCart(dto);
		
		System.out.println("** result : " + result);
	}

}
