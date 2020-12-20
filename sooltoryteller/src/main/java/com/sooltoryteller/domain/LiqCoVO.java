package com.sooltoryteller.domain;

import java.util.Date;

import javax.validation.constraints.NotBlank;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class LiqCoVO {
	
	// 양조장 일련번호 
	private Long liqCoId;

    // 양조장 이름 
	@NotBlank
	private String nm;

    // 양조장 주소 
    private String addr;

    // 홈페이지 
    private String hmpg;

    // 전화번호 
    @NotBlank
    private String telno;

    // 등록일시 
    private Date regdate;

    // 수정일시 
    private Date updatedate;
}
