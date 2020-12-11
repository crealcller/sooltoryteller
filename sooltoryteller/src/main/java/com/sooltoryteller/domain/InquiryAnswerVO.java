package com.sooltoryteller.domain;

import java.util.Date;

import javax.validation.constraints.NotEmpty;

public class InquiryAnswerVO {

	
	// 일련번호 
	@NotEmpty
    private int answerId;

    // 문의 
	@NotEmpty
    private int inquiryId;

    // 답변 내용 
    private String cn;

    // 답변 상태
    @NotEmpty
    private String anstus;

    // 작성일시 
    private Date regdate;
}
