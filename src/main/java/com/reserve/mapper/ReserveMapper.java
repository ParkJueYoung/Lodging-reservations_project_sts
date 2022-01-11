package com.reserve.mapper;

import java.util.List;

import com.reserve.model.LodgingVO;
import com.reserve.model.ReserveDTO;
import com.reserve.model.ReserveLodgingDTO;
import com.reserve.model.ReservePageLodgingDTO;

public interface ReserveMapper {

	// 예약 숙소 정보
	public ReservePageLodgingDTO getLodgingInfo(int lodgingId);
	
	// 예약 숙소 정보(예약 처리)
	public ReserveLodgingDTO getReserveInfo(int lodgingId);
	
	// 예약 테이블 등록
	public int enrollReserve(ReserveDTO res);
	
	// 예약 숙소 테이블 등록
	public int enrollReserveLodging(ReserveLodgingDTO reld);
	
	// 예약 재고 차감
	public int deductStock(LodgingVO lodging);
	
	// 예약 취소
	public int reserveCancel(String reserveId);
	
	// 예약 숙소 정보(예약 취소)
	public List<ReserveLodgingDTO> getReserveLodgingInfo(String reserveId);
	
	// 예약 정보(예약 취소)
	public ReserveDTO getReserve(String reserveId);
	
	
}
