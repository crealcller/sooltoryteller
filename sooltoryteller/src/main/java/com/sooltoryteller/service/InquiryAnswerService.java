package com.sooltoryteller.service;

import com.sooltoryteller.domain.InquiryAnswerVO;

public interface InquiryAnswerService {

	//문의글 조회
	public void checking(Long inquiryId, String inqstus);
	
	//답변조회
	public InquiryAnswerVO get(Long inquiryId);
	
	//답변등록
	public boolean register(InquiryAnswerVO inqAn, String inqstus);
	
	//답변상태 불러오기
	public String getStus(Long inquiryId);
}
