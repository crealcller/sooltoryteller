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
	
	private String dlvyFee = "무료";
	
	public int size() {
		return items.size();
	}
}
