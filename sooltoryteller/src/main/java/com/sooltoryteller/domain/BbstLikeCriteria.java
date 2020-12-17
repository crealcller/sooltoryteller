package com.sooltoryteller.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BbstLikeCriteria {

	private int pageNum;
	private int amount;
	
	private String type;
	private String keyword;
	
	public BbstLikeCriteria() {
		this(1, 12);
	}
	
	public BbstLikeCriteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public String[] getTypeArr() {
		return type ==  null ? new String[] {} : type.split("");
	}
}
