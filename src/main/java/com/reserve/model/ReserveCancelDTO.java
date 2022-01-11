package com.reserve.model;

public class ReserveCancelDTO {
	
	private String 	memberId;
	
	private String reserveId;
	
	private String keyword;
	
	private int amount;
	
	private int pageNum;

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getReserveId() {
		return reserveId;
	}

	public void setReserveId(String reserveId) {
		this.reserveId = reserveId;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	@Override
	public String toString() {
		return "ReserveCancelDTO [memberId=" + memberId + ", reserveId=" + reserveId + ", keyword=" + keyword
				+ ", amount=" + amount + ", pageNum=" + pageNum + "]";
	}
	
	
}
