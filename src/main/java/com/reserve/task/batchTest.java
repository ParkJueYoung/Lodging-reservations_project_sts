package com.reserve.task;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.reserve.service.LeaseServiceImpl;

@Component
public class batchTest {
	
	private static final Logger log = LoggerFactory.getLogger(LeaseServiceImpl.class);
	
	@Scheduled(cron = "0 * * * * *")
	public void testMethod() throws Exception{
		
		log.warn("배치 실행 테스트...........");
		log.warn("----------------------");
		
	}
	
}
