package com.reserve.mapper;

import java.util.List;

import com.reserve.model.CateFilterDTO;
import com.reserve.model.CateVO;
import com.reserve.model.Criteria;
import com.reserve.model.LodgingVO;

public interface LodgingMapper {
	
	// 숙소 검색
	public List<LodgingVO> getLodgingList(Criteria cri);
	
	// 숙소 총 개수
	public int lodgingGetTotal(Criteria cri);
	
	// 숙소 id 리스트 요청
	public String[] getLeaseIdList(String keyword);
	
	// 카라반 카테고리 리스트
	public List<CateVO> getCateCode1();
	
	// 캠핑장 카테고리 리스트
	public List<CateVO> getCateCode2();
	
	// 검색 대상 카테고리 리스트
	public String[] getCateList(Criteria cri);
	
	// 카테고리 정보(+검색대상 갯수)
	public CateFilterDTO getCateInfo(Criteria cri);
	
	// 숙소 정보
	public LodgingVO getLodgingInfo(int lodgingId);
	
	
}
