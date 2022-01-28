package com.onetouch.web.fct.info.dao;

import java.util.List;

import com.onetouch.web.pdt.plan.dao.PlanVO;


public interface InfoMapper {

	//현재 날자 조회
	InfoVO todayDate();
	//라인수정
	int LineUpdate(LineVO lineVO);
	//라인삭제
	int LineDelete(LineVO lineVO);
	//라인 조회 
	List<LineVO> LineSelect(LineVO lineVO);
	
	int LineInsert(LineVO lineVO);
	
	//List<InfoVO> selectFctGubun(InfoVO infoVO);
	//공정관리테이블 join
	List<InfoVO> selectprcCd(PlanVO vo);
	
	//설비코드 조회 
	List<InfoVO> selectCheckFct();
	//설비관리 수정
	int InfoUpdate(InfoVO infoVO);
	//설비 등록 조회 
	List<InfoVO> selectFctInfoAll(InfoVO infoVO);
	InfoVO selectFctInfo(InfoVO infoVO);
	//삭제
	void deleteFctInfo(List<InfoVO> list);
	//등록
	void insertFctInfo(InfoVO infoVO);
	
	
	
}
