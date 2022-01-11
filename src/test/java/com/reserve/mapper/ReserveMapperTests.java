package com.reserve.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.reserve.model.LodgingVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ReserveMapperTests {

	@Autowired
	private ReserveMapper mapper;

	/* 숙소 정보(예약 처리) */
//	@Test
//	public void getLodgingInfoTest() {
//		
//		 ReserveLodgingDTO reserveInfo = mapper.getReserveInfo(5);
//		 
//		 System.out.println("result : " + reserveInfo);
//	}

//	@Test
//	public void enrollReserveTest() {
//		
//		ReserveDTO res = new ReserveDTO();
//		List<ReserveLodgingDTO> reserves = new ArrayList();
//		
//		ReserveLodgingDTO reserve1 = new ReserveLodgingDTO();
//		
//		reserve1.setLodgingId(19);
//		reserve1.setLodgingCount(2);
//		reserve1.setLodgingPrice(20000);
//		
//		res.setReserves(reserves);
//		
//		res.setReserveId("2022_test1");
//		res.setReserveName("test");
//		res.setMemberId("adminck");
//		res.setReserveState("배송준비");
//		
//		mapper.enrollReserve(res);		
//		
//	}

//	@Test
//	public void enrollReserveLodigngTest() {
//		
//		ReserveLodgingDTO rld = new ReserveLodgingDTO();
//		
//		rld.setReserveId("2022_test1");
//		rld.setLodgingId(19);
//		rld.setLodgingCount(2);
//		rld.setLodgingPrice(20000);
//		
//		mapper.enrollReserveLodging(rld);
//		
//	}

	@Test
	public void deductStockTest() {
		LodgingVO lodging = new LodgingVO();

		lodging.setLodgingId(19);
		lodging.setLodgingStock(19);

		mapper.deductStock(lodging);
	}

}
