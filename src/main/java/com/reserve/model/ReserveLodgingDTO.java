package com.reserve.model;

public class ReserveLodgingDTO {

	// 예약 번호
	private String reserveId;
	
	// 숙소 번호
	private int lodgingId;
	
	// 예약 수량
	private int lodgingCount;
	
	// reserve_reserveLodging 기본키
	private int reserveLodgingId;
	
	// 숙소 하나 가격
	private int lodgingPrice;
	
	// 총 가격
	private int totalPrice;

	public String getReserveId() {
		return reserveId;
	}

	public void setReserveId(String reserveId) {
		this.reserveId = reserveId;
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

	public int getReserveLodgingId() {
		return reserveLodgingId;
	}

	public void setReserveLodgingId(int reserveLodgingId) {
		this.reserveLodgingId = reserveLodgingId;
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

	@Override
	public String toString() {
		return "ReserveLodging [reserveId=" + reserveId + ", lodgingId=" + lodgingId + ", lodgingCount=" + lodgingCount
				+ ", reserveLodgingId=" + reserveLodgingId + ", lodgingPrice=" + lodgingPrice + ", totalPrice="
				+ totalPrice + "]";
	}
	
	public void initTotal() {
		this.totalPrice = this.lodgingPrice * this.lodgingCount;
	}
	
	
}