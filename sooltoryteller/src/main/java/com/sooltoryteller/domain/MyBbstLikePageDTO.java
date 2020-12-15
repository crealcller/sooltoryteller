package com.sooltoryteller.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@AllArgsConstructor
@Getter
public class MyBbstLikePageDTO {

	// 내가 좋아요 누른 게시글수
	private int myLikeCnt;
	
	// 내가 좋아요 누른 게시글 리스트
	private List<BbstLikeJoinVO> myLikeList;
}
