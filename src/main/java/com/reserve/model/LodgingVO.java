package com.reserve.model;

import java.util.Date;
import java.util.List;

public class LodgingVO {
	
	// 숙소 id
	private int lodgingId;
	
	// 숙소 이름
	private String lodgingName;
	
	// 임대인 이름
	private int leaseId;
	
	// 카테고리 코드
	private String cateCode;
	
	// 숙소 가격
	private int lodgingPrice;
	
	// 숙소 재고
	private int lodgingStock;
	
	// 숙소 소개
	private String lodgingIntro;
	
	// 숙소 내용
	private String lodgingContents;
	
	// 등록 날짜
	private Date regDate;
	
	// 수정 날짜
	private Date updateDate;
	
	// 이미지 정보
	private List<AttachImageVO> imageList;

	public int getLodgingId() {
		return lodgingId;
	}

	public void setLodgingId(int lodgingId) {
		this.lodgingId = lodgingId;
	}

	public String getLodgingName() {
		return lodgingName;
	}

	public void setLodgingName(String lodgingName) {
		this.lodgingName = lodgingName;
	}

	public int getLeaseId() {
		return leaseId;
	}

	public void setLeaseId(int leaseId) {
		this.leaseId = leaseId;
	}

	public String getCateCode() {
		return cateCode;
	}

	public void setCateCode(String cateCode) {
		this.cateCode = cateCode;
	}

	public int getLodgingPrice() {
		return lodgingPrice;
	}

	public void setLodgingPrice(int lodgingPrice) {
		this.lodgingPrice = lodgingPrice;
	}

	public int getLodgingStock() {
		return lodgingStock;
	}

	public void setLodgingStock(int lodgingStock) {
		this.lodgingStock = lodgingStock;
	}

	public String getLodgingIntro() {
		return lodgingIntro;
	}

	public void setLodgingIntro(String lodgingIntro) {
		this.lodgingIntro = lodgingIntro;
	}

	public String getLodgingContents() {
		return lodgingContents;
	}

	public void setLodgingContents(String lodgingContents) {
		this.lodgingContents = lodgingContents;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public List<AttachImageVO> getImageList() {
		return imageList;
	}

	public void setImageList(List<AttachImageVO> imageList) {
		this.imageList = imageList;
	}

	@Override
	public String toString() {
		return "LodgingVO [lodgingId=" + lodgingId + ", lodgingName=" + lodgingName + ", leaseId=" + leaseId
				+ ", cateCode=" + cateCode + ", lodgingPrice=" + lodgingPrice + ", lodgingStock=" + lodgingStock
				+ ", lodgingIntro=" + lodgingIntro + ", lodgingContents=" + lodgingContents + ", regDate=" + regDate
				+ ", updateDate=" + updateDate + ", imageList=" + imageList + "]";
	}

	
	
	
}
