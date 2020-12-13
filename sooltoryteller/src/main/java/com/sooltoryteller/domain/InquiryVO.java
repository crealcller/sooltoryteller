package com.sooltoryteller.domain;

import java.util.Date;

import javax.validation.constraints.NotEmpty;

import lombok.Data;
@Data
public class InquiryVO {

	
	// 문의일련번호 
	@NotEmpty
    private Long inquiryId;

    // 회원 
	@NotEmpty
    private Long memberId;

    // 문의 제목
	@NotEmpty
    private String title;

    // 문의 내용
	@NotEmpty
    private String cn;

    // 문의 상태
    private String inqstus;

    // 작성일시 
    private Date regdate;
}
