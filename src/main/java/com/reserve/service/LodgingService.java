package com.reserve.service;

import java.util.List;

import com.reserve.model.CateFilterDTO;
import com.reserve.model.CateVO;
import com.reserve.model.Criteria;
import com.reserve.model.LodgingVO;

public interface LodgingService {
	
	// 숙소 검색
	public List<LodgingVO> getLodgingList(Criteria cri);
	
	// 숙소 개수
	public int lodgingGetTotal(Criteria cri);
	
	// 카라반 카테고리 리스트
	public List<CateVO> getCateCode1();
	
	// 캠핑장 카테고리 리스트
	public List<CateVO> getCateCode2();
	
	// 검색 결과 카테고리 필터 정보
	public List<CateFilterDTO> getCateInfoList(Criteria cri);
	
	// 숙소 정보
	public LodgingVO getLodgingInfo(int lodgingId);
	

}
