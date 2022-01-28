package com.onetouch.web.zzz.service;

import java.util.List;

import com.onetouch.web.zzz.dao.RoleVO;

public interface RoleService {
	List<RoleVO> selectRole(String uniqId);
}
