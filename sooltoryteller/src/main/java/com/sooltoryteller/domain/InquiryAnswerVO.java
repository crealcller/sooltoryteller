package com.sooltoryteller.domain;

import java.util.Date;

import javax.validation.constraints.NotEmpty;

import lombok.Data;
@Data
public class InquiryAnswerVO {

	
	// 일련번호 
	@NotEmpty
    private Long answerId;

    // 문의 
	@NotEmpty
    private Long inquiryId;

    // 답변 내용 
    private String cn;

    // 답변 상태
    private String anstus;

    // 작성일시 
    private Date regdate;
}
