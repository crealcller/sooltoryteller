package com.sooltoryteller.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@AllArgsConstructor
@Getter
public class MyBbstReplyPageDTO {

	// 내가 쓴 댓글수
	private int myReplyCnt;
	
	// 내가 쓴 댓글 리스트
	private List<BbstReplyJoinVO> myReplyList;
}
