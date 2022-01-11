package com.reserve.service;

import java.util.List;

import com.reserve.model.Criteria;
import com.reserve.model.LeaseVO;

public interface LeaseService {
	// 임대인 등록
	public void leaseEnroll(LeaseVO lease) throws Exception;
	
	// 임대인 목록
	public List<LeaseVO> leaseGetList(Criteria cri) throws Exception;
	
	// 임대인 총 개수
	public int leaseGetTotal(Criteria cri) throws Exception;
	
	// 임대인 상세 페이지
	public LeaseVO leaseGetDetail(int leaseId) throws Exception;
	
	// 임대인 정보 수정
	public int leaseModify(LeaseVO lease) throws Exception;
	
	// 임대인 정보 삭제
	public int leaseDelete(int leaseId);
}
