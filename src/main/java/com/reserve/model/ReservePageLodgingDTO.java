package com.reserve.model;

import java.util.List;

public class ReservePageLodgingDTO {

	private int lodgingId;
	
	private int lodgingCount;
	
	private String lodgingName;
	
	private int lodgingPrice;
	
	private int totalPrice;

	private List<AttachImageVO> imageList;
	
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

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public List<AttachImageVO> getImageList() {
		return imageList;
	}

	public void setImageList(List<AttachImageVO> imageList) {
		this.imageList = imageList;
	}

	@Override
	public String toString() {
		return "ReservePageLodgingDTO [lodgingId=" + lodgingId + ", lodgingCount=" + lodgingCount + ", lodgingName="
				+ lodgingName + ", lodgingPrice=" + lodgingPrice + ", totalPrice=" + totalPrice + ", imageList="
				+ imageList + "]";
	}
	
	
}
