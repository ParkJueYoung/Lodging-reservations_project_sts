package com.reserve.model;

import java.sql.Date;
import java.util.List;

public class ReserveDTO {

	// 예약 번호
	private String reserveId;
	
	// 예약 회원
	private String reserveName;
	
	// 예약 회원 아이디
	private String memberId;
	
	// 예약 상태
	private String reserveState;
	
	// 예약 숙소
	private List<ReserveLodgingDTO> reserves;
	
	// 예약 날짜
	private Date reserveDate;
	
	// 최종 예약 비용
	private int reserveFinalPrice;

	public String getReserveId() {
		return reserveId;
	}

	public void setReserveId(String reserveId) {
		this.reserveId = reserveId;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getReserveState() {
		return reserveState;
	}

	public void setReserveState(String reserveState) {
		this.reserveState = reserveState;
	}

	public List<ReserveLodgingDTO> getReserves() {
		return reserves;
	}

	public void setReserves(List<ReserveLodgingDTO> reserves) {
		this.reserves = reserves;
	}

	public Date getReserveDate() {
		return reserveDate;
	}

	public void setReserveDate(Date reserveDate) {
		this.reserveDate = reserveDate;
	}

	public int getReserveFinalPrice() {
		return reserveFinalPrice;
	}

	public void setReserveFinalPrice(int reserveFinalPrice) {
		this.reserveFinalPrice = reserveFinalPrice;
	}

	public String getReserveName() {
		return reserveName;
	}

	public void setReserveName(String reserveName) {
		this.reserveName = reserveName;
	}

	@Override
	public String toString() {
		return "ReserveDTO [reserveId=" + reserveId + ", reserveName=" + reserveName + ", memberId=" + memberId
				+ ", reserveState=" + reserveState + ", reserves=" + reserves + ", reserveDate=" + reserveDate
				+ ", reserveFinalPrice=" + reserveFinalPrice + "]";
	}

	public void getReservePriceInfo() {
		
		reserveFinalPrice = reserveFinalPrice;
		
	}


}
