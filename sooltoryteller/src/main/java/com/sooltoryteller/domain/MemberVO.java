package com.sooltoryteller.domain;

import java.util.Date;
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
	private String email;

	// 닉네임 
	private String name;

	// 비밀번호 
	private String pwd;

	// 전화번호 
	private String telno;

	// 술BTI 
	private String soolBti;

	// 프로필 사진 
	private String img;

	// 가입일시 
	private Date regdate;

	// 변경일시 
	private Date updatedate;

	// 가입상태 
	private String regstus = "JN";
	
}
