package com.sooltoryteller.domain;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberFavDrkVO {
/*
	private int soju;
	private int beer;
	private int makgeolli;
	private int cocktail;
	private int vodca;
	private int liquor;
	private int wine;
	private int orther;
*/
	
	// 일련번호 
    private Long favDrkId;

    // 회원아이디 
    private Long memberId;

    // 술코드 일련번호 
    private int drkCdId;
	
}
