package com.reserve.mapper;

import java.util.List;

import com.reserve.model.Criteria;
import com.reserve.model.LeaseVO;

public interface LeaseMapper {
	//임대인 등록
	public void leaseEnroll(LeaseVO lease);
	
	// 임대인 목록
	public List<LeaseVO> leaseGetList(Criteria cri);
	
	// 임대인 총 개수
	public int leaseGetTotal(Criteria cri);
	
	// 임대인 상세보기
	public LeaseVO leaseGetDetail(int leaseId);
	
	// 임대인 정보 수정
	public int leaseModify(LeaseVO lease);
	
	// 임대인 정보 삭제
	public int leaseDelete(int leaseId);
}
