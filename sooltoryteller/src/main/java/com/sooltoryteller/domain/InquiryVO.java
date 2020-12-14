package com.sooltoryteller.domain;

import java.util.Date;

import javax.validation.constraints.NotEmpty;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class InquiryVO {

	
	// 문의일련번호 
	@NotEmpty
    private Long inquiryId;

    // 회원 
    private String name;
	
	private String memberId;

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
