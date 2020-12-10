package com.sooltoryteller.service;

import java.util.List;

import com.sooltoryteller.domain.BbstReplyCriteria;
import com.sooltoryteller.domain.BbstReplyMemberJoinVO;
import com.sooltoryteller.domain.BbstReplyPageDTO;

public interface BbstReplyService {

	// 댓글 등록
	public int registerBbstReply(BbstReplyMemberJoinVO vo);
	
	// 댓글 조회
	public BbstReplyMemberJoinVO getBbstReply(Long bbstReplyId);
	
	// 댓글 수정
	public int modifyBbstReply(BbstReplyMemberJoinVO vo);
	
	// 댓글 삭제
	public int removeBbstReply(Long bbstReplyId);
	
	// 게시글의 모든 댓글 조회
	public List<BbstReplyMemberJoinVO> getBbstReplyList(BbstReplyCriteria cri, Long bbstId);
	
	// 게시글의 모든 댓글 개수 파악
	public BbstReplyPageDTO getBbstReplyListPage(BbstReplyCriteria cri, Long bbstId);
}
