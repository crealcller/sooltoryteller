package com.sooltoryteller.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@AllArgsConstructor
@Getter
public class MyBbstPageDTO {

	// 내가 쓴 게시글 수
	private int myBbstCnt;
	
	// 내가 쓴 게시글 리스트
	private List<BbstJoinVO> myBbstList;
}
