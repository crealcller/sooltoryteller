package com.sooltoryteller.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class AdminCriteria {

	private int pageNum;
	private int amount;
	
	public AdminCriteria() {
		this(1,10);
	}
	
	public AdminCriteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
}
