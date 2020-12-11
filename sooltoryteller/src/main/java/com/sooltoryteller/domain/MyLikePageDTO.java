package com.sooltoryteller.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@AllArgsConstructor
@Getter
public class MyLikePageDTO {
	
	//내가  좋아요한  수
	private int myLikeCnt;
	
	//내가 좋아요한 목록
	private List<MyLikeVO> myList;
}
