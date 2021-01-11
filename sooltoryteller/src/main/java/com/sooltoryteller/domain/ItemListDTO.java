package com.sooltoryteller.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ItemListDTO {

	private List<ItemDTO> items;

	// 배송비 
	private String dlvyFee = "무료";

	// 수령인 
	private String recipient;

	// 연락처 
	private String telno;

	// 배송지 
	private String ordAdr;

	public int size() {
		return items.size();
	}
}
