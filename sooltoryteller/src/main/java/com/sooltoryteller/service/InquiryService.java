package com.sooltoryteller.service;

import java.util.List;

import com.sooltoryteller.domain.AdminCriteria;
import com.sooltoryteller.domain.InquiryAdminVO;
import com.sooltoryteller.domain.InquiryVO;

public interface InquiryService {

	//문의 등록
	public void register(InquiryVO inq);
	
	//문의 조회
	public InquiryVO get(Long inquiryId);
	
	//문의 상태변경
	public boolean stateChange(Long inquiryId, String inqstus);
	
	//문의 리스트 조회
	//public List<InquiryAdminVO> getList();
	public List<InquiryAdminVO> getList(AdminCriteria adCri);
	
	//문의상태 불러오기
	public String getStus(Long inquiryId);
	
	//회원 아이디 가져오기
	public Long getMemberId(Long inquiryId);
	
	public int getTotal(AdminCriteria adCri);
}
