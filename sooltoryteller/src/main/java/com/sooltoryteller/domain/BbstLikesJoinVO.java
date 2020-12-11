package com.sooltoryteller.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BbstLikesJoinVO {

	// 좋아요 일련번호 
	private Long bbstLikesId;

	// 게시글 번호 
	private Long bbstId;

	// 회원아이디 
	private Long memberId;

	// 등록일시 
	private Date regdate;
	
	// 마이페이지
	// 내가 좋아요 누른 게시글 리스트
}
