package com.reserve.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.reserve.model.CartDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class CartMapperTests {
	
	@Autowired
	private CartMapper mapper;
	
//	@Test
//	public void addCart() {
//		String memberId = "admin123";
//		int lodgingId = 18;
//		int count = 2;
//		
//		CartDTO cart = new CartDTO();
//		cart.setMemberId(memberId);
//		cart.setLodgingId(lodgingId);
//		cart.setLodgingCount(count);
//		
//		int result = 0;
//		result = mapper.addCart(cart);
//		
//		System.out.println("결과 : " + result);
//		
//	}
	
//	@Test
//	public void deleteCartTest() {
//		int cartId = 3;
//		mapper.deleteCart(cartId);
//	}
	
//	@Test
//	public void modifyCartTest() {
//		int cartId = 4;
//		int count  = 5;
//		
//		CartDTO cart = new CartDTO();
//		cart.setCartId(cartId);
//		cart.setLodgingCount(count);
//		
//		mapper.modifyCount(cart);
//	}

//	@Test
//	public void checkCartTest() {
//		
//		String memberId = "admin123";
//		int lodgingId = 18;
//		
//		CartDTO cart = new CartDTO();
//		cart.setMemberId(memberId);
//		cart.setLodgingId(lodgingId);
//		
//		CartDTO resultCart = mapper.checkCart(cart);
//		System.out.println("결과 : " + resultCart);
//	}
	
	@Test
	public void deleteReserveCart() {
		
		String memberId = "adminck";
		int lodgingId = 19;
		
		CartDTO dto = new CartDTO();
		dto.setMemberId(memberId);
		dto.setLodgingId(lodgingId);
		
		mapper.deleteReserveCart(dto);
		
	}
	
}
