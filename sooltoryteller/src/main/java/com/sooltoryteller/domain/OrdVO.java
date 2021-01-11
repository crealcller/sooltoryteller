package com.sooltoryteller.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrdVO {

	// 주문번호 
	private Long ordId;

	// 고객번호 
	private Long memberId;

	// 주문일자 
	private Date ordDate;

	// 주문총수량 
	private int ttlQty;

	// 주문총금액 
	private int ttlPrc;

	// 주문상태 
	private int ordStus = 1;

	// 배송비 
	private String dlvyFee = "무료";

	// 수령인 
	private String recipient;

	// 연락처 
	private String telno;

	// 배송지 
	private String ordAdr;
}
