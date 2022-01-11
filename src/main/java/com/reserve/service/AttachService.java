package com.reserve.service;

import java.util.List;

import com.reserve.model.AttachImageVO;

public interface AttachService {
	
	// 이미지 데이터 반환
	public List<AttachImageVO> getAttachList(int lodgingId);
}
