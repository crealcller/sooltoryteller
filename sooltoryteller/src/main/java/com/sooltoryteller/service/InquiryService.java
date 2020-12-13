package com.sooltoryteller.service;

import java.util.List;

import com.sooltoryteller.domain.InquiryVO;

public interface InquiryService {

	//문의 등록
	public void register(InquiryVO inq);
	
	//문의 조회
	public InquiryVO get(Long inquiryId);
	
	//문의 상태변경
	public boolean stateChange(Long inquiryId, String inqstus);
	
	//문의 리스트 조회
	public List<InquiryVO> getList();
	
	//문의상태 불러오기
	public String getStus(Long inquiryId);
}
