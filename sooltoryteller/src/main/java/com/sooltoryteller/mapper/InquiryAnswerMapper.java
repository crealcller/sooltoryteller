package com.sooltoryteller.mapper;

import org.apache.ibatis.annotations.Param;

import com.sooltoryteller.domain.InquiryAnswerVO;

public interface InquiryAnswerMapper {

		
		//문의 조회하는 순간 답변테이블에 등록(상태:답변대기중) *시퀀스로 변경시 파라미터 지우기
		public void insert(Long inquiryId);
		
		//답변 조회
		public InquiryAnswerVO read(Long inquiryId);
		
		//답변전송->내용등록, 상태변경
		public int update(InquiryAnswerVO inqAn);
		
		//답변 상태 불러오기
		public String readStus(Long inquiryId);
}
