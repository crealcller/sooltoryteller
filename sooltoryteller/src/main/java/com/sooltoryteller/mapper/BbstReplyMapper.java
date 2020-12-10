package com.sooltoryteller.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sooltoryteller.domain.BbstReplyCriteria;
import com.sooltoryteller.domain.BbstReplyMemberJoinVO;

public interface BbstReplyMapper {
	
	// 댓글 등록
	public int insertBbstReply(BbstReplyMemberJoinVO vo);
	
	// 댓글 조회
	public BbstReplyMemberJoinVO readBbstReply(Long bbstReplyId);
	
	// 댓글 수정
	public int updateBbstReply(BbstReplyMemberJoinVO vo);
	
	// 댓글 삭제
	public int deleteBbstReply(Long bbstReplyId);
	
	// 게시글의 모든 댓글 조회
	public List<BbstReplyMemberJoinVO> getBbstReplyList(
		@Param("cri") BbstReplyCriteria cri,
		@Param("bbstId") Long bbstId);
	
	// 게시글의 모든 댓글 개수 파악
	public int getReplyCountByBbstId(Long bbstId);
}
