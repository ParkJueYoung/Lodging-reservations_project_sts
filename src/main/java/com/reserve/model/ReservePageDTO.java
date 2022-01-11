package com.reserve.model;

import java.util.List;

public class ReservePageDTO {

	private List<ReservePageLodgingDTO> reserves;

	public List<ReservePageLodgingDTO> getReserves() {
		return reserves;
	}

	public void setReserves(List<ReservePageLodgingDTO> reserves) {
		this.reserves = reserves;
	}

	@Override
	public String toString() {
		return "ReservePageDTO [reserves=" + reserves + "]";
	}
	
	
}
