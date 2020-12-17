package com.sooltoryteller.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BbstLikeJoinVO {

	// 좋아요 일련번호 
	private Long bbstlikeId;

	// 게시글 번호 
	private Long bbstId;

	// 회원아이디 
	private Long memberId;

	// 등록일시 
	private Date regdate;
	
	// 게시글 사진
	private String cnImg;
	
	// 조회수 
	private int viewCnt;

	// 댓글수 
	private int replyCnt;

	// 좋아요수 
	private int likeCnt;
}
