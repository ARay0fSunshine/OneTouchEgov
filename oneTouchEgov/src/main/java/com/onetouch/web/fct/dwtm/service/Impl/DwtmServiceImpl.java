package com.onetouch.web.fct.dwtm.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.onetouch.web.fct.dwtm.dao.DwtmMapper;
import com.onetouch.web.fct.dwtm.dao.DwtmVO;
import com.onetouch.web.fct.dwtm.service.DwtmService;

@Service
public class DwtmServiceImpl implements DwtmService {
	@Autowired DwtmMapper dmapper;
	
	//수리조회
	@Override
	public List<DwtmVO> dwtmSelect(DwtmVO dwtmVO) {
		return dmapper.dwtmSelect(dwtmVO);
	}

}
