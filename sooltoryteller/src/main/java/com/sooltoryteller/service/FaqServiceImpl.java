package com.sooltoryteller.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.sooltoryteller.domain.AdminCriteria;
import com.sooltoryteller.domain.FaqVO;
import com.sooltoryteller.mapper.FaqMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class FaqServiceImpl implements FaqService{

	private FaqMapper mapper;

	@Override
	public void register(FaqVO faq) {
		log.info("register.."+faq);
		mapper.insert(faq);
	}

	@Override
	public FaqVO get(Long faqId) {
		log.info("get......."+faqId);
		return mapper.read(faqId);
	}

	@Override
	public boolean modify(FaqVO faq) {
		log.info("modify...."+faq);
		return mapper.update(faq)==1;
	}

	@Override
	public boolean remove(Long faqId) {
		log.info("remove...."+faqId);
		return mapper.delete(faqId)==1;
	}

//	@Override
//	public List<FaqVO> getList() {
//		log.info("getList.....");
//		
//		return mapper.getList();
//	}

	@Override
	public List<FaqVO> getList(AdminCriteria adCri) {
		log.info("get List with criteria: " + adCri);
		return mapper.getListWithPaging(adCri);
	}

	@Override
	public int getTotal(AdminCriteria adCri) {
		log.info("get total count");
		return mapper.getTotalCount(adCri);
	}
	
	
}
