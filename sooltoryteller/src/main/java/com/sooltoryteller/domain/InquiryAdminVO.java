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
public class InquiryAdminVO {

	// 문의일련번호 
	    private Long inquiryId;

	    // 회원 
		@NotEmpty
	    private String name;

	    // 문의 제목
		@NotEmpty
		@Size(min=1, max=31) //1자 이상 31자 미만
	    private String title;

	    // 문의 내용
		@NotEmpty
		@Size(min=1, max=331) //1자 이상 331자 미만
	    private String cn;
		
		// 문의 작성일시 
	    private Date inqRegdate;
	    
	    // 답변 등록일시
	    private Date anRegdate;
	    
	    // 답변 상태
	    private String anstus;
}
