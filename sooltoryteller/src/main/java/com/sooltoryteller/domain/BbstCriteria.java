package com.sooltoryteller.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BbstCriteria {

	private int pageNum;
	private int amount;
	
	public BbstCriteria() {
		this(1, 9);
	}
	
	public BbstCriteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
}
