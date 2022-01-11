package com.reserve.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.reserve.mapper.LeaseMapper;
import com.reserve.model.Criteria;
import com.reserve.model.LeaseVO;

@Service
public class LeaseServiceImpl implements LeaseService{
	
	private static final Logger log = LoggerFactory.getLogger(LeaseServiceImpl.class);
	@Autowired
	LeaseMapper leaseMapper;
	
	@Override
    public void leaseEnroll(LeaseVO lease) throws Exception {
        
        leaseMapper.leaseEnroll(lease);
    }
	
	// 임대인 목록
	@Override
	public List<LeaseVO> leaseGetList(Criteria cri) throws Exception{
		
		log.info("(service)leaseGetList()......" + cri);
		
		return leaseMapper.leaseGetList(cri);
	}
	
	// 임대인 총 개수
	@Override
    public int leaseGetTotal(Criteria cri) throws Exception {
        log.info("(service)leaseGetTotal()......." + cri);
        return leaseMapper.leaseGetTotal(cri);
    }
	
	// 임대인 상세 페이지
	@Override
	public LeaseVO leaseGetDetail(int leaseId) throws Exception {
		log.info("authorGetDetail........" + leaseId);
		return leaseMapper.leaseGetDetail(leaseId);
	}
	
	// 임대인 정보 수정
	@Override
	public int leaseModify(LeaseVO lease) throws Exception{
		log.info("(service) leaseModify......." + lease);
		
		return leaseMapper.leaseModify(lease);
	}
	
	// 임대인 정보 삭제
	@Override
	public int leaseDelete(int leaseId) {
		
		log.info("(service) leaseDelete........");
		
		return leaseMapper.leaseDelete(leaseId);
		
	}
}
