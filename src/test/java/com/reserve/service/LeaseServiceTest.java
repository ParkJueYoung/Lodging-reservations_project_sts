package com.reserve.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.reserve.model.LeaseVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class LeaseServiceTest {
    
    //LeaseService 의존성 주입
    @Autowired
    private LeaseService service;
    
    @Test
    public void leaseEnrollTest() throws Exception {
 
        LeaseVO lease = new LeaseVO();
        
        lease.setTypeId("01");
        lease.setLeaseName("테스트");
        lease.setLeaseIntro("테스트 소개");
        
        service.leaseEnroll(lease);
        
    }
 
}
