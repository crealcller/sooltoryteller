package com.sooltoryteller.mapper;

import java.util.List;

import com.sooltoryteller.domain.AdminCriteria;
import com.sooltoryteller.domain.FaqVO;

public interface FaqMapper {
	//모든 FAQ불러오기
	public List<FaqVO> getList();
	
	//FAQ등록하기
	public void insert(FaqVO faq);
	
	public FaqVO read(Long faqId);
	
	public int delete(Long faqId);
	
	public int update(FaqVO faq);
	
	//페이징처리
	public List<FaqVO> getListWithPaging(AdminCriteria adCri);
	
	//모든 FAQ의 수
	public int getTotalCount(AdminCriteria adCri);
}
