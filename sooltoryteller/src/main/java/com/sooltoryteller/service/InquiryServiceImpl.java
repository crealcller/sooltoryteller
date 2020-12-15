package com.sooltoryteller.service;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sooltoryteller.domain.AdminCriteria;
import com.sooltoryteller.domain.InquiryAdminVO;
import com.sooltoryteller.domain.InquiryVO;
import com.sooltoryteller.mapper.InquiryAnswerMapper;
import com.sooltoryteller.mapper.InquiryMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class InquiryServiceImpl implements InquiryService{

	private InquiryMapper inqMapper;
	private InquiryAnswerMapper inqAnMapper;
	
	//문의 등록
	@Override
	public void register(InquiryVO inq) {
		log.info("Inquiry Register...."+inq);
		
		inqMapper.insert(inq);
		
	}

	//문의 조회
	@Transactional
	@Override
	public InquiryVO get(Long inquiryId) {
		log.info("Inquiry get...."+inquiryId);
		
		InquiryVO inq = inqMapper.read(inquiryId);
		
		log.info("inq : "+inq);
		//조회에 성공하면 문의 상태 변경
		
		log.info(inq.getInqstus());
		if(inq != null && inq.getInqstus().equals("IR")) {
			inqMapper.update(inquiryId, "IP");
			inqAnMapper.insert(inquiryId);
			
		}
		
		return inq;
	}

	//문의 상태변경
	@Override
	public boolean stateChange(Long inquiryId, String inqstus) {
		log.info("Inquiry stateChange..."+ inquiryId+inqstus);
		
		return inqMapper.update(inquiryId, inqstus)==1;
	}
	
	/*
	@Override
	public List<InquiryAdminVO> getList() {
		log.info("Inquiry getList.....");
		
		return inqMapper.getList();
	}
*/
	//문의 상태 불러오기
	@Override
	public String getStus(Long inquiryId) {
		
		return inqMapper.readStus(inquiryId);
	}

	//회원아이디가져오기
	@Override
	public Long getMemberId(Long inquiryId) {
		return inqMapper.getMemberId(inquiryId);
	}

	//문의리스트
	@Override
	public List<InquiryAdminVO> getList(AdminCriteria adCri) {
		log.info("get List with Criteria.."+adCri);
		
		return inqMapper.getListWithPaging(adCri);
	}

	@Override
	public int getTotal(AdminCriteria adCri) {
		log.info("get total count");
		
		return inqMapper.getTotalCount(adCri);
	}


}
