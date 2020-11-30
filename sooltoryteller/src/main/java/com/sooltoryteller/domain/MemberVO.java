package com.sooltoryteller.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberVO {

    // 이메일 
    private String memberEmail;

    // 닉네임 
    private String memberName;

    // 비밀번호 
    private String memberPwd;

    //프로필사진
    private String memberImg;
    // 가입일시 
    private Date regdate;
}
