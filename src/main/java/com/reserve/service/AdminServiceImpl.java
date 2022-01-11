package com.reserve.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.reserve.mapper.AdminMapper;
import com.reserve.model.AttachImageVO;
import com.reserve.model.CateVO;
import com.reserve.model.Criteria;
import com.reserve.model.LodgingVO;
import com.reserve.model.ReserveDTO;

@Service
public class AdminServiceImpl implements AdminService{
	
	private static final Logger log = LoggerFactory.getLogger(LeaseServiceImpl.class);
	
	@Autowired
	private AdminMapper adminMapper;
	
	// 숙소 등록
	@Transactional
	@Override
	public void lodgingEnroll(LodgingVO lodging) {
		
		log.info("(service)lodgingEnroll..........");
		
		adminMapper.lodgingEnroll(lodging);
		
		if(lodging.getImageList() == null || lodging.getImageList().size() <= 0) {
			return;
		}
		
		lodging.getImageList().forEach(attach ->{
			
			attach.setLodgingId(lodging.getLodgingId());
			adminMapper.imageEnroll(attach);
			
		});
		
	}
	
	
	// 카테고리 리스트
	@Override
	public List<CateVO> cateList() {
		
		log.info("(service)cateList............");
		
		return adminMapper.cateList();
		
	}
	
	// 숙소 리스트
	@Override
	public List<LodgingVO> lodgingGetList(Criteria cri){
		
		log.info("lodgingGetList().......");
		return adminMapper.lodgingGetList(cri);
	}
	
	// 숙소 총 개수
	@Override
	public int lodgingGetTotal(Criteria cri) {
		
		log.info("lodgingGetTotal()......");
		return adminMapper.lodgingGetTotal(cri);
		
	}
	
	// 숙소 조회
	@Override
	public LodgingVO lodgingGetDetail(int lodgingId) {
		
		log.info("(service)lodgingGetDetail........" + lodgingId);
		
		return adminMapper.lodgingGetDetail(lodgingId);
	}

	// 숙소 정보 수정
	@Transactional
	@Override
	public int lodgingModify(LodgingVO vo) {
		
		int result = adminMapper.lodgingModify(vo);
		
		if(result == 1 && vo.getImageList() != null && vo.getImageList().size() > 0) {
			
			adminMapper.deleteImageAll(vo.getLodgingId());
			
			vo.getImageList().forEach(attach -> {
				
				attach.setLodgingId(vo.getLodgingId());
				adminMapper.imageEnroll(attach);
				
			});
			
		}
		
		return result;		
	}
	
	// 숙소 정보 삭제
	@Override
	@Transactional
	public int lodgingDelete(int lodgingId) {
		
		log.info("lodgingDelete..........");
		
		adminMapper.deleteImageAll(lodgingId);
		
		return adminMapper.lodgingDelete(lodgingId);
	}
	
	// 지정 숙소 이미지 정보 얻기
	@Override
	public List<AttachImageVO> getAttachInfo(int bookId) {
		
		log.info("getAttachInfo........");
		
		
		return adminMapper.getAttachInfo(bookId);
	}
	
	// 예약 숙소 리스트
	@Override
	public List<ReserveDTO> getReserveList(Criteria cri){
		return adminMapper.getReserveList(cri);
	}
	
	@Override
	public int getReserveTotal(Criteria cri) {
		return adminMapper.getReserveTotal(cri);
	}
	
}
