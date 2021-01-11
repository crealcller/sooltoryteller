package com.sooltoryteller.domain;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BasketVO {

    // 일련번호 
    private int basketId;

    // 회원아이디 
    private int memberId;

    // 전통주 일련번호 
    private int liqId;

    // 수량 
    private int qty;
}