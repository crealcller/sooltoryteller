package com.sooltoryteller.domain;

import java.util.Date;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class MemberVO {
	
	//회원아이디
	private Long memberId;

	// 이메일 
	@NotEmpty
	@Email
	private String email;

	// 닉네임 
	@NotEmpty
	@Pattern(regexp = "[\\w\\Wㄱ-ㅎㅏ-ㅣ가-힣]{2,8}")
	private String name;

	// 비밀번호 
	@NotEmpty
	@Pattern(regexp = "(?=.*?[a-zA-Z])(?=.*?[#?!@$%^&*-]).{5,16}")
	private String pwd;

	// 전화번호 
	@NotEmpty
	@Pattern(regexp = "\\d{3}\\d{3,4}\\d{4}")
	private String telno;

	// 프로필 사진 
	private String img;

	// 가입일시 
	private Date regdate;
	
	// 변경일시
	private Date udpatedate;
	
	// 가입상태
	private String regstus;
}
