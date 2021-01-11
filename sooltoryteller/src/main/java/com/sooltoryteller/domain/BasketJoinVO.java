package com.sooltoryteller.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BasketJoinVO {

	//장바구니 아이디
	private Long basketId;
	
	//전통주 아이디
	private Long liqId;
	
	//전통주 이름
	private String liqNm;
	
	//수량
	private int qty;
	
	//전통주 이미지
	private String liqImg;
	
	//회원아이디
	private Long memberId;
	
	//양조장 이름
	private String coNm;
	
	//전통주 합계가격
	private int amount;
}
