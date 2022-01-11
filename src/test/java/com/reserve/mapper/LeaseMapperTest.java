package com.reserve.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.reserve.model.Criteria;
import com.reserve.model.LeaseVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class LeaseMapperTest {
 
    @Autowired
    private LeaseMapper mapper;
    
    /*
    // 임대인 등록 테스트 
    @Test
    public void leaseEnroll() throws Exception{
        
        LeaseVO lease = new LeaseVO();
        
        lease.setTypeId("01");
        lease.setLeaseName("테스트");
        lease.setLeaseIntro("테스트 소개");
        
        mapper.leaseEnroll(lease);
        
    }   
    */ 
    
    /*
    // 임대인 목록 테스트
    @Test
    public void leaseGetListTest() throws Exception{
        
        Criteria cri = new Criteria(10,1);    // 3페이지 & 10개 행 표시
        cri.setKeyword("카라반");
        
        List<LeaseVO> list = mapper.leaseGetList(cri);
        
        for(int i = 0; i < list.size(); i++) {
            System.out.println("list" + i + ".........." + list.get(i));
        }
        
    }
    */
    /*
    // 임대인 개수
    @Test
    public void leaseGetTotalTest() throws Exception{
    	Criteria cri = new Criteria();
    	cri.setKeyword("카라반");
    	
    	int total = mapper.leaseGetTotal(cri);
    	
    	System.out.println("total......." + total);
    }
    */
    
    /*
    // 임대인 상세 페이지
    @Test
    public void leaseGetDetailTest() {
    	int leaseId = 30;
    	LeaseVO lease = mapper.leaseGetDetail(leaseId);
    	System.out.println("lease......" + lease);
    }
    */
    
    // 임대인 정보 수정
//	@Test
//	public void leaseModifyTest() {
//		
//		LeaseVO lease = new LeaseVO();
//				
//		lease.setLeaseId(1);
//		System.out.println("수정 전...................." + mapper.leaseGetDetail(lease.getLeaseId()));
//		
//		lease.setLeaseName("수정");
//		lease.setTypeId("01");
//		lease.setLeaseIntro("소개 수정 하였습니다.");
//		
//		mapper.leaseModify(lease);
//		System.out.println("수정 후...................." + mapper.leaseGetDetail(lease.getLeaseId()));
//		
//	}
    
    // 임대인 정보 삭제
    @Test
    public void leaseDeleteTest() {
    	
    	int leaseId = 9;
    	
    	int result = mapper.leaseDelete(leaseId);
    	
    	if(result == 1) {
    		System.out.println("삭제 성공");
    	}
    	
    }
}