package com.sooltoryteller.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sooltoryteller.domain.AdminCriteria;
import com.sooltoryteller.domain.MemberVO;
import com.sooltoryteller.mapper.AdminMapper;
import com.sooltoryteller.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class AdminServiceImpl implements AdminService{

	private AdminMapper mapper;
	
	//모든 회원 불러오기(페이징처리)
	@Override
	public List<MemberVO> getList(AdminCriteria adCri) {
		log.info("get List with criteria: " + adCri);
		return mapper.getListWithPaging(adCri);
	}

	@Override
	public int getTotal(AdminCriteria adCri) {
		log.info("get total count");
		return mapper.getTotalCount(adCri);
	}

	
}
