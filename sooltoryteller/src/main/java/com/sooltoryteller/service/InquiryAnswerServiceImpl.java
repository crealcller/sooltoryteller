package com.sooltoryteller.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fasterxml.jackson.annotation.JsonTypeInfo.Id;
import com.sooltoryteller.domain.InquiryAnswerVO;
import com.sooltoryteller.mapper.InquiryAnswerMapper;
import com.sooltoryteller.mapper.InquiryMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class InquiryAnswerServiceImpl implements InquiryAnswerService{

	private InquiryMapper inqMapper;
	private InquiryAnswerMapper inqAnMapper;
	
	//문의글 조회
	@Transactional
	@Override
	public void checking(Long inquiryId, String inqstus) {
		log.info("Inquiry checking...."+inquiryId);

		inqAnMapper.insert(inquiryId);
		inqMapper.update(inquiryId, inqstus);
		
	}

	//답변조회
	@Override
	public InquiryAnswerVO get(Long inquiryId) {
		log.info("Answer get...."+inquiryId);
		
		return inqAnMapper.read(inquiryId);
	}

	//답변등록
	@Transactional
	@Override
	public boolean register(InquiryAnswerVO inqAn, String inqstus) {
		log.info("Answer register...."+inqAn);
		
		String regStus = inqMapper.readStus(inqAn.getInquiryId());
		
		if(!regStus.equalsIgnoreCase("IC")) {
			if(inqAnMapper.update(inqAn) == 1) {
				inqMapper.update(inqAn.getInquiryId(), inqstus);
				return true;
			}
		}
		
		return false;
	}

	//답변 상태 불러오기
	@Override
	public String getStus(Long inquiryId) {
		
		return inqAnMapper.readStus(inquiryId);
	}

}
