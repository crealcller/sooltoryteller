package com.sooltoryteller.service;

import java.util.List;

import com.sooltoryteller.domain.AdminCriteria;
import com.sooltoryteller.domain.MemberVO;

public interface AdminService {

	public List<MemberVO> getList(AdminCriteria adCri);
	
	public int getTotal(AdminCriteria adCri);
}
