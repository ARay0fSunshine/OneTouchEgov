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
		for(PrcVO vo : list) {
			int rand=(int) (Math.random()*100);
			PrcVO vo2 =mapper.autoFltSum(vo);
			if(Integer.parseInt(vo.getGoalCnt())>(Integer.parseInt(vo2.getFltCnt())+Integer.parseInt(vo.getPdtCnt()))) {
				int uph;
				uph=mapper.uphFind(vo);
				if(rand<95) {
					vo.setPdtCnt(String.valueOf(uph+Integer.parseInt(vo.getPdtCnt())));
					mapper.autoUpdate(vo);
				}else {
					vo.setPdtCnt(String.valueOf(uph+Integer.parseInt(vo.getFltCnt())));
					mapper.autoFltUpdate(vo);
				}
			}
		}
	}
}
