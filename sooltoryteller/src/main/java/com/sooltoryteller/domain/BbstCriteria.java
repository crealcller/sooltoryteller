package com.sooltoryteller.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BbstCriteria {

	private int pageNum;
	private int amount;
	
	private String type;
	private String keyword;
	
	public BbstCriteria() {
		this(1, 9);
	}
	
	public BbstCriteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public String[] getTypeArr() {
		return type ==  null ? new String[] {} : type.split("");
	}
	
	public String getBbstListLink() {
		
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
			.queryParam("pageNum", this.pageNum)
			.queryParam("amount", this.getAmount())
			.queryParam("type", this.getType())
			.queryParam("keyword", this.getKeyword());
		
		return builder.toUriString();
	}
}
