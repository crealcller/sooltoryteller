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
public class FaqVO {
	
	//일련번호
	private Long faqId;
	
	//제목
	@NotEmpty
	@Size(min=1, max=31) //1자 이상 31자 미만
	private String title;
	
	//내용
	@NotEmpty
	@Size(min=1, max=331) //1자 이상 331자 미만
	private String cn;
	
	//작성일자
	private Date regdate;
	
	//수정일자
	private Date updatedate;
}
