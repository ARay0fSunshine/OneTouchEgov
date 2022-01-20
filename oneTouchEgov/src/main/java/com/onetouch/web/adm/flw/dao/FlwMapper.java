package com.onetouch.web.adm.flw.dao;

import java.util.List;

import com.onetouch.web.adm.bom.dao.BomVO;
import com.onetouch.web.adm.bom.dao.PrdVO;
import com.onetouch.web.pdt.plan.dao.PlanVO;

public interface FlwMapper {
	List<FlwVO> selectFlw(FlwVO flwvo);
	void deleteFlw(FlwVO flwvo);
	void updateFlw(FlwVO flwvo);
	void updatePrd(PrdVO prdvo);
	List<BomVO> selectFlwPrcBom(PlanVO vo);
}
