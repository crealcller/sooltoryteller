package com.sooltoryteller.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sooltoryteller.domain.AdminCriteria;
import com.sooltoryteller.domain.InquiryAdminVO;
import com.sooltoryteller.domain.InquiryVO;

public interface InquiryMapper {
	//모든 문의 리스트
	//public List<InquiryAdminVO> getList();
	
	public List<InquiryAdminVO> getListWithPaging(AdminCriteria adCri);
	
	public int getTotalCount(AdminCriteria adCri);
	
	//문의 등록
	public void insert(InquiryVO inq);
	
	//문의 조회
	public InquiryVO read(Long inquiryId);
	
	//관리자가 문의를 조회, 답변전송 하면 상태변경
	public int update(@Param("inquiryId")Long inquiryId, @Param("inqstus")String inqstus);
	
	//문의 상태 불러오기
	public String readStus(Long inquiryId);
	
	//회원 아이디 불러오기
	public Long getMemberId(Long inquiryId);
}
