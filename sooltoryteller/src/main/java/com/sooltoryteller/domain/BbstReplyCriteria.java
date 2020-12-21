package com.sooltoryteller.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BbstReplyCriteria {

	private int pageNum;
	private int amount;
	
	private String type;
	private String keyword;
	
	public BbstReplyCriteria() {
		this(1, 5);
	}
	
	public BbstReplyCriteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public String[] getTypeArr() {
		return type ==  null ? new String[] {} : type.split("");
	}
}
