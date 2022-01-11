package com.reserve.service;

import java.util.List;

import com.reserve.model.AttachImageVO;
import com.reserve.model.CateVO;
import com.reserve.model.Criteria;
import com.reserve.model.LodgingVO;
import com.reserve.model.ReserveDTO;

public interface AdminService {

	// 숙소 등록
	public void lodgingEnroll(LodgingVO lodging);
	
	// 카테고리 리스트
	public List<CateVO> cateList();
	
	// 숙소 리스트
	public List<LodgingVO> lodgingGetList(Criteria cri);
	
	// 숙소 총 개수
	public int lodgingGetTotal(Criteria cri);
	
	// 숙소 조회
	public LodgingVO lodgingGetDetail(int lodgingId);
	
	// 숙소 정보 수정
	public int lodgingModify(LodgingVO vo);
	
	// 숙소 정보 삭제
	public int lodgingDelete(int lodgingId);
	
	// 지정 숙소 정보 얻기
	public List<AttachImageVO> getAttachInfo(int lodgingId);
	
	// 예약 숙소 리스트
	public List<ReserveDTO> getReserveList(Criteria cri);
	
	// 예약 총 갯수
	public int getReserveTotal(Criteria cri);
	
}
