package com.sooltoryteller.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderDTO {

	// 주문한 항목들 리스트
	List<ItemDTO> items;

	private String name;

	// 주문총수량
	private String ttlQty;

	// 주문총금액
	private String ttlPrc;

}
