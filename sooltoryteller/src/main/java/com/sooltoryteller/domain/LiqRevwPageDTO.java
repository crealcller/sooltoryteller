package com.sooltoryteller.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@AllArgsConstructor
@Getter
public class LiqRevwPageDTO {

	//리뷰수 카운트
	private int revwCnt;
	
	//리뷰 리스트 
	private List<LiqRevwVO> list;
}
