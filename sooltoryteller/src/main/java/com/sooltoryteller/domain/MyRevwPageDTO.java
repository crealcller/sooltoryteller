package com.sooltoryteller.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@AllArgsConstructor
@Getter
public class MyRevwPageDTO {

	//내가 작성한 리뷰수
	private int myRevwCnt;
	
	//내가 작성한 리뷰 목록
	private List<MyRevwVO> myList;
}
