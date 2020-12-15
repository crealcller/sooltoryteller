package com.sooltoryteller.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@AllArgsConstructor
@Getter
public class BbstReplyPageDTO {

	// 게새글 당 작성된 댓글수
	private int replyCnt;
	
	// 게시글 당 작성된 댓글 리스트
	private List<BbstReplyJoinVO> list;
}
