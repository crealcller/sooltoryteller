package com.sooltoryteller.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

//게시글 좋아요
@Data
@AllArgsConstructor
@NoArgsConstructor
public class BbstLikeVO {

	// 좋아요 일련번호 
	private Long bbstlikeId;

	// 게시글 번호 
	private Long bbstId;

	// 회원아이디 
	private Long memberId;

	// 등록일시 
	private Date regdate;
}