package com.sooltoryteller.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
// 주문/결제 1건
public class OrderJoinVO {

	// 상품 사진
	private String liqThumb;
	
	// 상품 정보
	private String liqNm;
	
	// 상품 단가
	private int prc;
	
	// 주문 수량
	private int ordQty;
	
	// 주문 금액 (상품 단가 x 수량)
	private int ordPrc;
	
	// 판매자
	private String liqCoNm;
	
	@Builder.Default
	// 배송비
	private String dlvyFee = "무료";
	
	public OrderJoinVO toEntity() {
		return OrderJoinVO.builder()
			.liqThumb(liqThumb)
			.liqNm(liqNm)
			.prc(prc)
			.ordQty(ordQty)
			.ordPrc(prc * ordQty)
			.liqCoNm(liqCoNm)
			.dlvyFee(dlvyFee)
			.build();
	}
}
