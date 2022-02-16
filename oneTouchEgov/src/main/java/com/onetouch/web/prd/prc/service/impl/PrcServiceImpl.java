package com.onetouch.web.prd.prc.service.impl;

import java.awt.AWTException;
import java.awt.Robot;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.onetouch.web.prd.prc.dao.PrcMapper;
import com.onetouch.web.prd.prc.dao.PrcVO;
import com.onetouch.web.prd.prc.service.PrcService;

@Service
public class PrcServiceImpl implements PrcService{
	@Autowired PrcMapper mapper;
	
	@Override
	public List<PrcVO> lineList() {
		return mapper.lineList();
	}

	@Override
	public List<PrcVO> prcList(String lineNo) {
		return mapper.prcList(lineNo);
	}

	@Override
	public List<PrcVO> prdPrcList(PrcVO vo) {
		return mapper.prdPrcList(vo);
	}

	@Override
	public PrcVO prcFlowMinMax(PrcVO vo) {

		List<PrcVO> list=mapper.prcFlowMinMax(vo);
		int flowMax=0;
		int flowMin=100;
		// flow min max 구하는 for문
		for(PrcVO resultVo: list) {
			System.out.println(resultVo);
			String a=resultVo.getPrcSeq().substring(0,1);
			if(flowMax<Integer.parseInt(a)) {
				flowMax=Integer.parseInt(a);
			};
			if(flowMin>Integer.parseInt(a)) {
				flowMin=Integer.parseInt(a);
			}
		}
		String a=(mapper.myPrcFlow(vo)).getPrcSeq().substring(0,1);//내공정흐름번호
		if(flowMin==Integer.parseInt(a)) { //공정흐름 1번이 들어온경우
			for(PrcVO insertVo:list) {
				System.out.println(insertVo);
				mapper.defaultInsert(insertVo);
			}
			mapper.startUpdate(vo); //시간업데이트
			vo=mapper.startTimeSelect(vo);  //입력된시간불러와서 리턴
			vo.setMsg("라인가동이 시작되었습니다.");
			return vo;
		}else if(flowMin!=Integer.parseInt(a)&&mapper.lineStartCheck(vo).size()==0) { //1번흐름이아니고 line 셀렉트했는데 결과가 없는경우 (라인시작이안됨)
			vo.setMsg("라인이 가동되지 않았습니다.");
			return vo;
		}

		else if(Integer.parseInt(a)!=1 &&  Integer.parseInt(a)-1==mapper.flowCheck(vo)) { //1번흐름이 아니고 스타트시간찍힌애들의 합이 내플로우 -1과같을떄(라인시작o 앞공정시작o)
			mapper.startUpdate(vo); //시간업데이트
			vo=mapper.startTimeSelect(vo);
			vo.setMsg("공정이 시작되었습니다.");
			return vo;
		}
		else{
			mapper.startTimeSelect(vo);
			vo.setMsg("이전 공정이 시작되지 않았습니다.");
			return vo; 
		}
	}

	@Override
	public PrcVO prcEnd(PrcVO vo) {
		List<PrcVO> list=mapper.prcFlowMinMax(vo);
		int flowMax=0;
		int flowMin=100;
		PrcVO vo100 = new PrcVO();
		vo100=vo;
		System.out.println("111111111111111111");
		System.out.println(vo100);
		// flow min max 구하는 for문
		for(PrcVO resultVo: list) {
			System.out.println(resultVo);
			String a=resultVo.getPrcSeq().substring(0,1);
			if(flowMax<Integer.parseInt(a)) {
				flowMax=Integer.parseInt(a);
			};
			if(flowMin>Integer.parseInt(a)) {
				flowMin=Integer.parseInt(a);
			}
		}
		String a=(mapper.myPrcFlow(vo)).getPrcSeq().substring(0,1);//내공정흐름번호
		if(flowMin==Integer.parseInt(a)) { //공정흐름 1번이 들어온경우
			vo.setMsg("공정종료");
			mapper.endUpdate(vo); //시간업데이트
			vo=mapper.endTimeSelect(vo);  //입력된시간불러와서 리턴
			vo.setMsg("공정이 종료되었습니다.");
			return vo;
		}
		else if(mapper.lineEndCheck(vo).get(0).getPrcEndNull()==0) { //라인종료시간찍힌 로우의 합이 0일때
			vo.setMsg("이전 공정이 종료되지 않았습니다.");
			return vo; 
		}
		else if(Integer.parseInt(a)!=flowMax &&  Integer.parseInt(a)-1==mapper.endFlowCheck(vo)) { //1번흐름이 아니고 엔드시간찍힌애들의 합이 내플로우 -1과같을떄(앞공정종료o)
			vo.setMsg("공정종료");
			mapper.endUpdate(vo); //시간업데이트
			vo=mapper.endTimeSelect(vo);
			vo.setMsg("공정이 종료되었습니다.");
			return vo;
		}
		else if(Integer.parseInt(a)-1==mapper.endFlowCheck(vo) &&  Integer.parseInt(a)==flowMax) {
			vo100.setMsg("라인가동종료");
			mapper.endUpdate(vo100); //시간업데이트
			vo=mapper.endTimeSelect(vo100);
			//lot 번호 부여
			
			String sect=mapper.sectSelect(vo100);
			if(sect.equals("PDT_SECT002")) {
				String lot=(mapper.insertHrdLotSelect(vo100)).getPrdLot();
				vo100.setPrdLot(lot);
				vo.setPrdLot(lot);
				mapper.hrdInsert(vo100);
			}
			else if(sect.equals("PDT_SECT001")) {
				String lot=(mapper.insertLotSelect(vo100)).getPrdLot();
				vo100.setPrdLot(lot);
				vo.setPrdLot(lot);
				mapper.prdInsert(vo100);
			}
			mapper.planPhsUpdate(vo100);
			vo.setMsg("라인 가동이 종료되었습니다.");
			return vo;
		}
		else{
			mapper.endTimeSelect(vo);
			vo.setMsg("이전 공정이 종료되지 않았습니다.");
			return vo; 
		}
		
		
	}
//void updateFlt(PrcVO vo);
//	PrcVO realFlt(PrcVO vo);
	
	@Override
	public PrcVO selectCheck(PrcVO vo) {
//		try {
//			Robot robot=new Robot();
//			PrcVO vo2=new PrcVO();
//			int i=0;
//			vo2=vo;
			return mapper.realFlt(vo);
//			String fltSave=mapper.realFlt(vo).getSumFlt();  
//			String pdtSave=mapper.realFlt(vo).getPdtCnt();
//			System.out.println(fltSave+",,"+pdtSave);
//			while(true){
//				String flt=mapper.realFlt(vo2).getSumFlt(); 
//				String pdt=mapper.realFlt(vo2).getPdtCnt();
//				System.out.println(mapper.realFlt(vo)+"...."+fltSave);
//				if(!fltSave.equals(flt)||fltSave==vo.getGoalCnt()||!pdtSave.equals(pdt)||pdtSave==vo.getPdtCnt()) {
//					return mapper.realFlt(vo);
//
//				}
//				robot.delay(3000);
//				i++;
//				if(i==9) {
//					return null;
//				}
//			}
//		} catch (AWTException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		return null;
	}

	
	@Override
	public void updateFlt(PrcVO vo) {
		mapper.updateFlt(vo); //1
	}

	@Override
	public void fastStop(PrcVO vo) {
		//긴급중단 좀더생각해보자.
		mapper.fastStopUpdate(vo);
		mapper.fastStop(vo);
		
	}

	@Override
	public List<PrcVO> prcMovingView(PrcVO vo) {
		try {
			Robot robot=new Robot();
			int upCheck=mapper.updateCheck();
			System.out.println("1111");
			System.out.println(vo);
			System.out.println(upCheck);
			int i=0;
			while(true) {
				if(upCheck!=(mapper.updateCheck())) {
					return mapper.prcMovingView(vo);
				}
				robot.delay(2000);
				i++;
				if(i==9) {
					return null;
				}
			}
		} catch (AWTException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<PrcVO> movingSearchList(PrcVO vo) {
		
		if("Y".equals(vo.getPrcCheck())){
			System.out.println("진행종료");
			return mapper.movingSearchListFinish(vo);
		}
		else{
			System.out.println("미진행");
			return mapper.movingSearchList(vo);
		}
	}
	
	
	
	/*
	 * @Scheduled(fixedDelay = 10000) //10초마다 실행 (실행시간 별도) public void selectTask1()
	 * { List<PrcVO> list= new ArrayList<>(); list=mapper.autoSelect(); int
	 * rand=(int) (Math.random()*100); for(PrcVO vo : list) { PrcVO vo2
	 * =mapper.autoFltSum(vo);
	 * if(Integer.parseInt(vo.getGoalCnt())>Integer.parseInt(vo2.getFltCnt())+
	 * Integer.parseInt(vo.getPdtCnt())) { int uph; uph=mapper.uphFind(vo);
	 * if(rand<70) {
	 * vo.setPdtCnt(String.valueOf(uph+Integer.parseInt(vo.getPdtCnt())));
	 * mapper.autoUpdate(vo); }else {
	 * vo.setPdtCnt(String.valueOf(uph+Integer.parseInt(vo.getFltCnt())));
	 * mapper.autoFltUpdate(vo); } } } }
	 */

	@Override
	public List<List<PrcVO>> dashBoardData() {
		List<PrcVO> list=mapper.playStartInstr();
		List<List<PrcVO>> bigList=new ArrayList<>();
		for(PrcVO vo1 : list) {
			
			bigList.add(mapper.liveInstr(vo1));
			
		}
		return bigList;
	}
	

	

}
