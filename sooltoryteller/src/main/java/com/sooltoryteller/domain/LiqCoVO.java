package com.sooltoryteller.domain;

import java.util.Date;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

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
	@NotBlank(message = "이름은 공백일 수 없습니다.")
	@Size(min = 1, max = 20, message = "이름이 양식에 맞지않습니다.")
	private String nm;

    // 양조장 주소 
	@NotBlank(message = "주소는 공백일 수 없습니다.")
	@Size(min = 1, max = 30, message = "주소가 양식에 맞지않습니다.")
    private String addr;

    // 홈페이지 
	@Size(min = 0, max = 15, message = "홈페이지주소가 양식에 맞지않습니다.")
    private String hmpg;

    // 전화번호 
    @NotBlank(message = "전화번호는 공백일 수 없습니다.")
	@Size(min = 1, max = 15, message = "전화번호가 양식에 맞지않습니다.")
    private String telno;

    // 등록일시 
    private Date regdate;

    // 수정일시 
    private Date updatedate;
}
