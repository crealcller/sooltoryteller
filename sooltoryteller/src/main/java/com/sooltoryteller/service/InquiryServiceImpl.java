package com.sooltoryteller.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.sooltoryteller.domain.InquiryVO;
import com.sooltoryteller.mapper.InquiryMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class InquiryServiceImpl implements InquiryService{

	private InquiryMapper mapper;
	
	//문의 등록
	@Override
	public void register(InquiryVO inq) {
		log.info("Inquiry Register...."+inq);
		
		mapper.insert(inq);
		
	}

	//문의 조회
	@Override
	public InquiryVO get(Long inquiryId) {
		log.info("Inquiry get...."+inquiryId);

		return mapper.read(inquiryId);
	}

	//문의 상태변경
	@Override
	public boolean stateChange(Long inquiryId, String inqstus) {
		log.info("Inquiry stateChange..."+ inquiryId+inqstus);
		
		return mapper.update(inquiryId, inqstus)==1;
	}
	
	//문의 리스트 조회
	@Override
	public List<InquiryVO> getList() {
		log.info("Inquiry getList.....");
		
		return mapper.getList();
	}

	//문의 상태 불러오기
	@Override
	public String getStus(Long inquiryId) {
		
		return mapper.readStus(inquiryId);
	}

}
