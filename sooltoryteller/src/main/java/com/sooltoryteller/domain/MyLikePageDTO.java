package com.sooltoryteller.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@AllArgsConstructor
@Getter
public class MyLikePageDTO {
	
	private int myLikeCnt;
	private List<MyLikeVO> myList;
}
