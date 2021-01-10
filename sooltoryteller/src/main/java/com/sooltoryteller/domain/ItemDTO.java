package com.sooltoryteller.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ItemDTO {

	// 상품번호
	private Long liqId;

	// 상품단가
	private int prc;
	
	// 주문수량
	private int qty;
	
}
