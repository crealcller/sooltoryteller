package com.sooltoryteller.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrdDtlVO {

	// 주문내역 일련번호 
    private Long ordDtlId;

    // 주문번호 
    private Long ordId;

    // 상품번호 
    private Long liqId;

    // 주문수량 
    private int ordQty;

    // 주문금액 
    private int ordPrc;

    // 주문일자 
    private Date ordDate;
}
