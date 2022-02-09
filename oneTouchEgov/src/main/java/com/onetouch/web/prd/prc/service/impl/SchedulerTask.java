package com.onetouch.web.prd.prc.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.onetouch.web.prd.prc.dao.PrcMapper;
import com.onetouch.web.prd.prc.dao.PrcVO;

@Component
public class SchedulerTask {
	
	@Autowired PrcMapper mapper;
	
	@Scheduled(fixedDelay = 10000) //10초마다 실행 (실행시간 별도)
	public void selectTask1() {
		List<PrcVO> list= new ArrayList<>();
		list=mapper.autoSelect();
		System.out.println(list);
		for(PrcVO vo : list) {
			if(Integer.parseInt(vo.getGoalCnt())>Integer.parseInt(vo.getPdtCnt())) {
				
				int uph=mapper.uphFind(vo);
				System.out.println(uph);
				System.out.println(vo.getPdtCnt());
				vo.setPdtCnt(String.valueOf(uph+Integer.parseInt(vo.getPdtCnt())));
				System.out.println(vo);
				mapper.autoUpdate(vo);
			}
		}
	}
}