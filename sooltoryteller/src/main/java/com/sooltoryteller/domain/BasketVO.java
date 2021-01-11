package com.sooltoryteller.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BasketVO {
	
	// 장바구니 일련번호 
    private int basketId;

    // 회원아이디 (일련번호)
    private Long memberId;

    // 전통주 일련번호 
    private Long liqId;

    // 수량 
    private int qty;
    
    //합계
    private int amount;
}
