package com.sooltoryteller.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderJoinListVO {

	// 주문 항목 리스트
	private List<OrderJoinVO> ordList;
	
	// 배송지 정보
	
	
	// 주문자 정보
	
	
	// 주문 전체 내역
	private TotalOrderDTO ttlOrd;
	
}
