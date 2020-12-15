package com.sooltoryteller.domain;

import java.util.Date;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class InquiryVO {

	
	// 문의일련번호 
    private Long inquiryId;

    // 회원 
    private String name;
	
	private String memberId;

    // 문의 제목
	@NotEmpty
	@Size(min=1, max=31) //1자 이상 31자 미만
    private String title;

    // 문의 내용
	@NotEmpty
	@Size(min=1, max=331) //1자 이상 331자 미만
    private String cn;

    // 문의 상태
    private String inqstus;

    // 작성일시 
    private Date regdate;
}
