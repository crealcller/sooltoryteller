package com.sooltoryteller.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class AdminPageDTO {

	private int startPage;
	private int endPage;
	private boolean prev, next;
	
	private int total;
	private AdminCriteria adCri;
	
	public AdminPageDTO(AdminCriteria adCri, int total) {
		this.adCri = adCri;
		this.total = total;
		
		this.endPage = (int)(Math.ceil(adCri.getPageNum()/10.0))*10;
		this.startPage = this.endPage - 9;
		
		int realEnd = (int)(Math.ceil((total * 1.0)/ adCri.getAmount()));
		
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
	
}
