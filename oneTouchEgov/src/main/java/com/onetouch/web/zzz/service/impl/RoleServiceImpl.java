package com.onetouch.web.zzz.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.onetouch.web.zzz.dao.RoleMapper;
import com.onetouch.web.zzz.dao.RoleVO;
import com.onetouch.web.zzz.service.RoleService;

@Service
public class RoleServiceImpl implements RoleService{
	
	@Autowired RoleMapper mapper;

	@Override
	public List<RoleVO> selectRole(String uniqId) {
		System.out.println(uniqId);
		return mapper.selectRole(uniqId);
	}

}
