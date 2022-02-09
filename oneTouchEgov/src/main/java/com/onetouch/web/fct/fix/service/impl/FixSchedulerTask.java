package com.onetouch.web.fct.fix.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.onetouch.web.fct.fix.dao.FixMapper;
import com.onetouch.web.fct.fix.dao.FixVO;

@Component
public class FixSchedulerTask {
	
	@Autowired FixMapper fmapper;
	
	@Scheduled(fixedDelay = 10000) //10초마다 실행 (실행시간 별도)
	public void selectprdPrcMngSelect() {
		System.out.println("수리요청");
		for(FixVO fixVO : fmapper.prdPrcMngSelect()) {
			fmapper.insertRequestFixFtc(fixVO);
			System.out.println("설비 비동기 상태 바꿔주기 ");
			System.out.println(fixVO.getFctCd());
			System.out.println(fmapper.updateChangeFct(fixVO));
		}
	}
}
