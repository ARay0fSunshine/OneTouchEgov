package com.onetouch.web.adm.bom.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.onetouch.web.adm.bom.dao.BomMapper;
import com.onetouch.web.adm.bom.dao.BomVO;
import com.onetouch.web.adm.bom.dao.PrdVO;
import com.onetouch.web.adm.bom.service.BomService;
import com.onetouch.web.zzz.dao.ModifyVO;

@Service
public class BomServiceImpl implements BomService {

	@Autowired BomMapper mapper;
	@Override
	public List<PrdVO> selectPrd(PrdVO prdvo) {
		return mapper.selectPrd(prdvo);
	}

	@Override
	public List<BomVO> selectBomDtl(BomVO bomvo) {
		return mapper.selectBomDtl(bomvo);
	}
 
	@Override
	public List<PrdVO> selectPrdAll() {
		return mapper.selectPrdAll();
	}
	
	@Override
	public List<PrdVO> selectUsePrdAll() {
		return mapper.selectUsePrdAll();
	}

	@Override
	public List<PrdVO> selectUsePrd() {
		return mapper.selectUsePrd();
	}

	@Override
	public void modify(ModifyVO<BomVO> mvo) {
		if(mvo.getCreatedRows() != null) {
			for(BomVO bomvo : mvo.getCreatedRows()) {
				mapper.insertBom(bomvo);
			};
		}
		if(mvo.getUpdatedRows() != null) {
			for(BomVO bomvo : mvo.getUpdatedRows()) {
				mapper.updateBom(bomvo);
			};
		}
		if(mvo.getDeletedRows() != null) {
			for(BomVO bomvo : mvo.getDeletedRows()) {
				mapper.deleteBom(bomvo);
			};
		}
		
	}

	@Override
	public void modifyPrd(ModifyVO<PrdVO> mvo) {
		if(mvo.getCreatedRows() != null) {
			for(PrdVO prdvo : mvo.getCreatedRows()) {
				mapper.insertPrd(prdvo);
			};
		}
		if(mvo.getDeletedRows() != null) {
			for(PrdVO prdvo : mvo.getDeletedRows()) {
				mapper.deletePrd(prdvo);
			};
		}
		if(mvo.getUpdatedRows() != null) {
			for(PrdVO prdvo : mvo.getUpdatedRows()) {
				mapper.updatePrd(prdvo);
			};
		}
		
	}

	@Override
	public void insertPrd(PrdVO prdvo) {
		mapper.insertPrd(prdvo);
	}

	@Override
	public void updatePrd(PrdVO prdvo) {
		mapper.updatePrd(prdvo);
	}

	@Override
	public void deletePrd(PrdVO prdvo) {
		mapper.deletePrd(prdvo);
		
	}

	@Override
	public List<PrdVO> selectPrdSize() {
		return mapper.selectPrdSize();
	}

	@Override
	public List<PrdVO> selectPrdSect() {
		return mapper.selectPrdSect();
	}


}
