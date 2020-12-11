package com.sooltoryteller.domain;

import java.util.Date;

import javax.validation.constraints.NotEmpty;

public class InquiryVO {

	
	// 문의일련번호 
	@NotEmpty
    private int inquiryId;

    // 회원 
	@NotEmpty
    private int memberId;

    // 문의 제목
	@NotEmpty
    private String title;

    // 문의 내용
	@NotEmpty
    private String cn;

    // 문의 상태
	@NotEmpty
    private String inqstus;

    // 작성일시 
    private Date regdate;
}
