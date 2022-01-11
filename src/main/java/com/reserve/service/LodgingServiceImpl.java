package com.reserve.service;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.reserve.mapper.AdminMapper;
import com.reserve.mapper.AttachMapper;
import com.reserve.mapper.LodgingMapper;
import com.reserve.model.AttachImageVO;
import com.reserve.model.CateFilterDTO;
import com.reserve.model.CateVO;
import com.reserve.model.Criteria;
import com.reserve.model.LodgingVO;

@Service
public class LodgingServiceImpl implements LodgingService{
	
	private static final Logger log = LoggerFactory.getLogger(LeaseServiceImpl.class);
	
	@Autowired
	private LodgingMapper lodgingMapper;
	
	@Autowired
	private AttachMapper attachMapper;
	
	@Autowired
	private AdminMapper adminMapper;
	
	/* 숙소 검색 */
	@Override
	public List<LodgingVO> getLodgingList(Criteria cri) {
		
		log.info("getLodgingList().......");
		
		String type = cri.getType();
		String[] typeArr = type.split("");
		String[] leaseArr = lodgingMapper.getLeaseIdList(cri.getKeyword());
		
		if(type.equals("A") || type.equals("AC") || type.equals("AT") || type.equals("ACT")) {
			if(leaseArr.length == 0) {
				return new ArrayList();
			}
		}
		
		for(String t : typeArr) {
			if(t.equals("A")) {
				cri.setLeaseArr(leaseArr);
			}
		}
		
		List<LodgingVO> list = lodgingMapper.getLodgingList(cri);
		
		list.forEach(lodging -> {
			
			int lodgingId = lodging.getLodgingId();
			
			List<AttachImageVO> imageList = attachMapper.getAttachList(lodgingId);
			
			lodging.setImageList(imageList);
			
		});
		
		return list;
	}

	/* 숙소 총 갯수 */
	@Override
	public int lodgingGetTotal(Criteria cri) {
		
		log.info("lodgingGetTotal().......");
		
		return lodgingMapper.lodgingGetTotal(cri);
		
	}
	
	/* 카라반 카테고리 리스트 */
	@Override
	public List<CateVO> getCateCode1() {
		
		log.info("getCateCode1().........");
		
		return lodgingMapper.getCateCode1();
	}

	/* 캠핑장 카테고리 리스트 */
	@Override
	public List<CateVO> getCateCode2() {
		
		log.info("getCateCode2().........");
		
		return lodgingMapper.getCateCode2();
	}
	
	// 검색 결과 카테고리 필터 정보
	@Override
	public List<CateFilterDTO> getCateInfoList(Criteria cri){
		
List<CateFilterDTO> filterInfoList = new ArrayList<CateFilterDTO>();
		
		String[] typeArr = cri.getType().split("");
		String [] leaseArr;
		
		for(String type : typeArr) {
			if(type.equals("A")){
				leaseArr = lodgingMapper.getLeaseIdList(cri.getKeyword());
				if(leaseArr.length == 0) {
					return filterInfoList;
				}
				cri.setLeaseArr(leaseArr);
			}
		}
		
		String[] cateList = lodgingMapper.getCateList(cri);
		
		String tempCateCode = cri.getCateCode();
		
		for(String cateCode : cateList) {
			cri.setCateCode(cateCode);
			CateFilterDTO filterInfo = lodgingMapper.getCateInfo(cri);
			filterInfoList.add(filterInfo);
		}
		
		cri.setCateCode(tempCateCode);
		
		return filterInfoList;
		
	}
	
	@Override
	public LodgingVO getLodgingInfo(int lodgingId) {
		
		LodgingVO lodgingInfo = lodgingMapper.getLodgingInfo(lodgingId);
		lodgingInfo.setImageList(adminMapper.getAttachInfo(lodgingId));
		
		return lodgingInfo;
	}
	
}
