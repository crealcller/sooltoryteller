package com.sooltoryteller.service;

import java.util.List;

import com.sooltoryteller.domain.AdminCriteria;
import com.sooltoryteller.domain.FaqVO;

public interface FaqService {

	public void register(FaqVO faq);
	
	public FaqVO get(Long faqId);
	
	public boolean modify(FaqVO faq);
	
	public boolean remove(Long faqId);
	
//	public List<FaqVO> getList();
	public List<FaqVO> getList(AdminCriteria adCri);
	
	public int getTotal(AdminCriteria adCri);
}
