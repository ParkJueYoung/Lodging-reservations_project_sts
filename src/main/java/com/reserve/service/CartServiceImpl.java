package com.reserve.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.reserve.mapper.AttachMapper;
import com.reserve.mapper.CartMapper;
import com.reserve.model.AttachImageVO;
import com.reserve.model.CartDTO;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	private CartMapper cartMapper;
	
	@Autowired 
	private AttachMapper attachMapper;

	@Override
	public int addCart(CartDTO cart) {

		// 장바구니 데이터 체크
		CartDTO checkCart = cartMapper.checkCart(cart);

		if (checkCart != null) {
			return 2;
		}

		// 장바구니 등록 & 에러시 0 반환
		try {
			return cartMapper.addCart(cart);
		} catch (Exception e) {
			return 0;
		}

	}

	@Override
	public List<CartDTO> getCartList(String memberId) {

		List<CartDTO> cart = cartMapper.getCart(memberId);

		for (CartDTO dto : cart) {

			// 종합 정보 초기화 
			dto.initTotal();
			
			/* 이미지 정보 얻기 */
			int lodgingId = dto.getLodgingId();
			
			List<AttachImageVO> imageList = attachMapper.getAttachList(lodgingId);
			
			dto.setImageList(imageList);
		}

		return cart;
	}

	@Override
	public int modifyCount(CartDTO cart) {
		
		return cartMapper.modifyCount(cart);
		
	}
	
	@Override
	public int deleteCart(int cartId) {
		
		return cartMapper.deleteCart(cartId);
		
	}
	
	
}
