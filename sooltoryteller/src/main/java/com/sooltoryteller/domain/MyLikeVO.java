package com.sooltoryteller.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MyLikeVO {
	// 일련번호 
    private int liqLikeId;
    
    //회원아이디
  	private Long memberId;

  	// 닉네임 
  	private String name;
  	
  	// 프로필 사진 
  	private String profile;

    // 전통주 일련번호 
    private Long liqId;
    
    // 전통주 이름 
    private String nm;

    // 가격 
    private int prc;

    // 주종 
    private String cate;
    
    // 용량 
    private int capct;

    // 도수 
    private int lv;

    // 원재료 
    private String irdnt;

    // 수상내역 
    private String ards;

    // 전통주 사진 
    private String img;

}
