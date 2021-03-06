package com.reserve.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.reserve.mapper.AttachMapper;
import com.reserve.mapper.CartMapper;
import com.reserve.mapper.LodgingMapper;
import com.reserve.mapper.MemberMapper;
import com.reserve.mapper.ReserveMapper;
import com.reserve.model.AttachImageVO;
import com.reserve.model.CartDTO;
import com.reserve.model.LodgingVO;
import com.reserve.model.MemberVO;
import com.reserve.model.ReserveCancelDTO;
import com.reserve.model.ReserveDTO;
import com.reserve.model.ReserveLodgingDTO;
import com.reserve.model.ReservePageLodgingDTO;

@Service
public class ReserveServiceImpl implements ReserveService{

	
	@Autowired
	private ReserveMapper reserveMapper;
	
	@Autowired
	private AttachMapper attachMapper;
	
	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private CartMapper cartMapper;
	
	@Autowired
	private LodgingMapper lodgingMapper;
	
	@Override
	public List<ReservePageLodgingDTO> getLodgingInfo(List<ReservePageLodgingDTO> reserves)	{
		
		List<ReservePageLodgingDTO> result = new ArrayList<ReservePageLodgingDTO>();		
		
		for(ReservePageLodgingDTO rsv : reserves) {
			
			ReservePageLodgingDTO lodgingInfo = reserveMapper.getLodgingInfo(rsv.getLodgingId());			

			lodgingInfo.setLodgingCount(rsv.getLodgingCount());
			
			List<AttachImageVO> imageList = attachMapper.getAttachList(lodgingInfo.getLodgingId());
			
			lodgingInfo.setImageList(imageList);
			
			result.add(lodgingInfo);			
		}		
		
		return result;
		
	}
	
	@Override
	@Transactional
	public void reserve(ReserveDTO res) {
		
		MemberVO member = memberMapper.getMemberInfo(res.getMemberId());
		
		List<ReserveLodgingDTO> ress = new ArrayList<>();
		
		for(ReserveLodgingDTO rld : res.getReserves()) {
			
			ReserveLodgingDTO reserveLodging = reserveMapper.getReserveInfo(rld.getLodgingId());
			// ?????? ??????
			reserveLodging.setLodgingCount(rld.getLodgingCount());
			// ?????? ?????? ??????
			reserveLodging.getLodgingPrice();
			// List ?????? ??????
			ress.add(reserveLodging);
			
		}
		// ReserveDTO ??????
		res.setReserves(ress);
		res.getReservePriceInfo();
		
		
		// reserveId ????????? ??? ReserveDTO ?????? reserveId??? ??????
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("_yyyyMMddmm");
		String reserveId = member.getMemberId() + format.format(date);
		res.setReserveId(reserveId);
		
		// DB ??????
		reserveMapper.enrollReserve(res);	// reserve_reserve ??????
		for(ReserveLodgingDTO rld : res.getReserves()) { // reserve_reserveLodging ??????
			
			rld.setReserveId(reserveId);
			reserveMapper.enrollReserveLodging(rld);
			
		}
		
		// ?????? ?????? ??????
		for(ReserveLodgingDTO rld : res.getReserves()) {
			
			// ?????? ?????? ??? ?????????
			LodgingVO lodging = lodgingMapper.getLodgingInfo(rld.getLodgingId());
			lodging.setLodgingStock(lodging.getLodgingStock() - rld.getLodgingCount());
			
			// ?????? ??? DB ??????
			reserveMapper.deductStock(lodging);
			
		}
		
		// ???????????? ??????
		for(ReserveLodgingDTO rld : res.getReserves()) {
			
			CartDTO dto = new CartDTO();
			dto.setMemberId(res.getMemberId());
			dto.setLodgingId(rld.getLodgingId());
			
			cartMapper.deleteReserveCart(dto);
			
		}
		
	}
	
	// ?????? ??????
	@Override
	@Transactional
	public void reserveCancel(ReserveCancelDTO dto) {
		
		// ??????
		MemberVO member = memberMapper.getMemberInfo(dto.getMemberId());
		
		// ?????? ??????
		List<ReserveLodgingDTO> ress = reserveMapper.getReserveLodgingInfo(dto.getReserveId());
		for(ReserveLodgingDTO res : ress) {
			res.initTotal();
		}
		
		// ??????
		ReserveDTO rev = reserveMapper.getReserve(dto.getReserveId());
		rev.setReserves(ress);
		
		rev.getReservePriceInfo();
		
		// ???????????? ?????? DB
		reserveMapper.reserveCancel(dto.getReserveId());
		
		// ??????
		for(ReserveLodgingDTO res : rev.getReserves()) {
			
			LodgingVO lodging = lodgingMapper.getLodgingInfo(res.getLodgingId());
			lodging.setLodgingStock(lodging.getLodgingStock() + res.getLodgingCount());
			reserveMapper.deductStock(lodging);
			
		}
		
		
	}
	
}
