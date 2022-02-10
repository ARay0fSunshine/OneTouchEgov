package com.onetouch.web.fct.info.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.onetouch.web.fct.info.dao.InfoMapper;

@Component
public class InfoSchedulerTask {
	@Autowired InfoMapper mapper;
	
	@Scheduled(fixedDelay = 10000)
	public void updateStartFctPhs( ) {
		System.out.println("가동상태전환");
		mapper.updateStartFctPhs();
		
	}
}
