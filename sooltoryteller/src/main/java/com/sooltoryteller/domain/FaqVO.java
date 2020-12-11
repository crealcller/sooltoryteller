package com.sooltoryteller.domain;

import java.util.Date;

import javax.validation.constraints.NotEmpty;

import lombok.Data;
@Data
public class FaqVO {
	
	//일련번호
	@NotEmpty
	private Long faqId;
	
	//제목
	@NotEmpty
	private String title;
	
	//내용
	@NotEmpty
	private String cn;
	
	//작성일자
	private Date regdate;
	
	//수정일자
	private Date updatedate;
}
