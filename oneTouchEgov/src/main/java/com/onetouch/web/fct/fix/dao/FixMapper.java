package com.onetouch.web.fct.fix.dao;

import java.util.List;

public interface FixMapper {
	//수리테이블 조회 
	List<FixVO> fixSelectList(FixVO fixVO);
	void insertFtc(FixVO fixVO);
	void updateFtc(FixVO fixVO);
	void deleteFtc(FixVO fixVO);
	
}
