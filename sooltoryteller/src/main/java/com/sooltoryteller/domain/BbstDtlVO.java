package com.sooltoryteller.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

// 게시글 조회, 좋아요 
@Data
@AllArgsConstructor
@NoArgsConstructor
public class BbstDtlVO {

	// 일련번호 
	private Long bbstDtlId;

	// 게시글 번호 
	private Long bbstId;

	// 회원ID 
	private Long memberId;

	// 좋아요 
	private int likes = 0;

	// 조회 
	private int inqr = 0;
}
