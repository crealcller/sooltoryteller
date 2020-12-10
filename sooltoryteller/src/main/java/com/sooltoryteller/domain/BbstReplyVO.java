package com.sooltoryteller.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

// 게시글 댓글
@Data
@AllArgsConstructor
@NoArgsConstructor
public class BbstReplyVO {

	// 일련번호 
	private Long bbstReplyId;

	// 게시글 번호 
	private Long bbstId;

	// 회원ID 
	private Long memberId;

	// 댓글 내용 
	private String replyCn;

	// 등록일시 
	private Date regdate;

	// 변경일시 
	private Date updatedate;
}
