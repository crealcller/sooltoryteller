package com.sooltoryteller.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sooltoryteller.domain.BbstReplyCriteria;
import com.sooltoryteller.domain.BbstReplyJoinVO;
import com.sooltoryteller.domain.BbstReplyPageDTO;
import com.sooltoryteller.domain.MyBbstReplyPageDTO;

public interface BbstReplyService {

	// 댓글 등록
	public int registerBbstReply(
		BbstReplyJoinVO vo
		);
	
	// 댓글 조회
	public BbstReplyJoinVO getBbstReply(Long bbstReplyId);
	
	// 댓글 수정
	public int modifyBbstReply(BbstReplyJoinVO vo);
	
	// 댓글 삭제
	public int removeBbstReply(Long bbstReplyId);

	// 게시글 삭제 시 댓글도 삭제
	public int deleteReplyWithBbst(Long bbstId);
	
	// 게시글의 모든 댓글 조회
	public List<BbstReplyJoinVO> getBbstReplyList(
		@Param("cri") BbstReplyCriteria cri,
		@Param("bbstId") Long bbstId);
	
	// 게시글의 모든 댓글 개수 파악
	public BbstReplyPageDTO getBbstReplyListPage(
		@Param("cri") BbstReplyCriteria cri,
		@Param("bbstId") Long bbstId);
	
	// 마이페이지
	// 내가 쓴 댓글 리스트
	public MyBbstReplyPageDTO getMyBbstReply(
		@Param("cri") BbstReplyCriteria cri,
		@Param("memberId") Long memberId);
}
