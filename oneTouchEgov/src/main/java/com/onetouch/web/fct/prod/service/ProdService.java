package com.onetouch.web.fct.prod.service;

import java.util.List;

import com.onetouch.web.fct.prod.dao.ProdVO;
import com.onetouch.web.zzz.dao.ModifyVO;

public interface ProdService {
	ProdVO selectFctExpectDtProd(ProdVO prodVO);
	ProdVO selectFctProd();
	ProdVO selectchkExpectDt(ProdVO prodVO);
	void modify(ModifyVO<ProdVO> mvo);
	List<ProdVO> prodSelect(ProdVO prodVSO);
	List<ProdVO> prodCheckSelectList(ProdVO prodVO);
}
