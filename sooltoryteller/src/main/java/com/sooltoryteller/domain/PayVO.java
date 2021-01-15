package com.sooltoryteller.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PayVO {

    // 결제 일련번호 
    private Long payId;

    // 주문번호 
    private Long ordId;
    
    // 회원아이디
    private Long memberId;

    // 결제수단 
    private String payMthd;

    // 결제금액 
    private int ordPrc;

    // 결제상태 
    private String stus;

    // 결제일 
    private Date payDate;
}
