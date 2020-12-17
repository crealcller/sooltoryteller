package com.sooltoryteller.domain;

import java.util.Date;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

//회원 
@Data
@AllArgsConstructor
@NoArgsConstructor

public class MemberVO {
	
	//회원아이디
	private Long memberId;

	// 이메일 
	@NotEmpty
	@Pattern(regexp = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+.[A-Za-z0-9.-]$")
	private String email;

	// 닉네임 
	@NotEmpty
	@Pattern(regexp = "^[가-힣]{2,8}$")
	private String name;

	// 비밀번호 
	@NotEmpty
	@Pattern(regexp = "^(?=.*[a-zA-Z])(?=.*[#?!@$%^&*-]).{5,16}$")
	private String pwd;

	// 전화번호 
	@NotEmpty
	@Pattern(regexp = "^01([0|1|6|7|8|9]?)([0-9]{3,4})([0-9]{4})$")
	private String telno;

	// 프로필 사진 
	private String img;

	// 가입일시 
	private Date regdate;
	
	// 변경일시
	private Date updatedate;
	
	// 가입상태
	private String regstus;
}
