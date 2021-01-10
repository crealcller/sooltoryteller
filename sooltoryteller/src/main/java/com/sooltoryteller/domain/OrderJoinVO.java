package com.sooltoryteller.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderJoinVO {

	// 주문번호
	private Long ordDtlId;
	
	// 고객번호
	private Long memberId;
	
	// 주문일자
	private Date ordDate;
	
	// 주문총수량
	private int ttlQty;
	
	// 주문총금액
	private int ttlPrc;
	
	
	// 주문상태
	private int ordStus;
	
	
	// 배송비
	private String dlvyFee = "무료";
	
	// 수령인
	private String recipient;
	
	// 연락처
	private String telno;
	
	// 우편번호
	private String zipcode;
	
	// 도로명주소
	private String ordAdr;
	
	// 상세주소
	private String ordAdrDtl;
	
	
	// 상품번호
	private Long liqId;
	
	// 주문수량
	private int ordQty;
	
	// 주문금액
	private int ordPrc;
	
}
