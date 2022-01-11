package com.reserve.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.reserve.mapper.AttachMapper;
import com.reserve.model.AttachImageVO;

@Service
public class AttachServiceImpl implements AttachService{
	
	private static final Logger log = LoggerFactory.getLogger(LeaseServiceImpl.class);
	
	@Autowired
	private AttachMapper attachMapper;
	
	// 이미지 데이터 반환
	@Override
	public List<AttachImageVO> getAttachList(int lodgingId){
		
		log.info("getAttachList.............");
		
		return attachMapper.getAttachList(lodgingId);
		
	}
}
