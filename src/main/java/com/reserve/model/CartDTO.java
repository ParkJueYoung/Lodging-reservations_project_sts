package com.reserve.model;

import java.util.List;

public class CartDTO {
	
	private int cartId;
	
	private String memberId;
	
	private int lodgingId;
	
	private int lodgingCount;
	
	private String lodgingName;
	
	private int lodgingPrice;
	
	private int totalPrice;

	// 숙소 이미지
	private List<AttachImageVO> imageList;
	
	public int getCartId() {
		return cartId;
	}

	public void setCartId(int cartId) {
		this.cartId = cartId;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getLodgingId() {
		return lodgingId;
	}

	public void setLodgingId(int lodgingId) {
		this.lodgingId = lodgingId;
	}

	public int getLodgingCount() {
		return lodgingCount;
	}

	public void setLodgingCount(int lodgingCount) {
		this.lodgingCount = lodgingCount;
	}

	public String getLodgingName() {
		return lodgingName;
	}

	public void setLodgingName(String lodgingName) {
		this.lodgingName = lodgingName;
	}

	public int getLodgingPrice() {
		return lodgingPrice;
	}

	public void setLodgingPrice(int lodgingPrice) {
		this.lodgingPrice = lodgingPrice;
	}

	public int getTotalPrice() {
		return totalPrice;
	}
	
	public void initTotal() {
		
		this.totalPrice = this.lodgingPrice * this.lodgingCount;
		
	}

	public List<AttachImageVO> getImageList() {
		return imageList;
	}

	public void setImageList(List<AttachImageVO> imageList) {
		this.imageList = imageList;
	}

	@Override
	public String toString() {
		return "CartDTO [cartId=" + cartId + ", memberId=" + memberId + ", lodgingId=" + lodgingId + ", lodgingCount="
				+ lodgingCount + ", lodgingName=" + lodgingName + ", lodgingPrice=" + lodgingPrice + ", totalPrice="
				+ totalPrice + ", imageList=" + imageList + "]";
	}

	

	
	
}
