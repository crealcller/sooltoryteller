package com.sooltoryteller.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {
	//시퀀스(1차 테스트 끝나고 삭제하기)
	private int memberSeq;
	
	// 이메일 
    private String memberEmail;

    // 닉네임 
    private String memberName;

    // 비밀번호 
    private String memberPwd;

    // 전화번호 
    private String memberTelno;

    // 술BTI 
    private String memberSoolBti;

    // 프로필 사진 
    private String memberImg;

    // 가입일시 
    private Date regdate;

    // 변경일시 
    private Date updatedate;

    // 가입상태 
    private String regstus;
}
