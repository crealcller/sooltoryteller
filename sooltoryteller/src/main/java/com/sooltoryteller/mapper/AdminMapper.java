package com.sooltoryteller.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sooltoryteller.domain.AdminCriteria;
import com.sooltoryteller.domain.MemberVO;

public interface AdminMapper {
	//회원리스트 페이징처리
	public List<MemberVO> getListWithPaging(AdminCriteria adCri);
	
	//모든회원의 수
	public int getTotalCount(AdminCriteria adCri);
}
