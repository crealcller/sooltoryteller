package com.sooltoryteller.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sooltoryteller.domain.BbstReplyCriteria;
import com.sooltoryteller.domain.BbstReplyJoinVO;

public interface BbstReplyMapper {
	
	// 댓글 등록
	public int insertBbstReply(BbstReplyJoinVO vo);
	
	// 댓글수 업데이트
	public void updateReplyCnt(
		@Param("bbstId") Long bbstId,
		@Param("cnt") int cnt);
	
	// 댓글수
	public int getBbstReplyCnt(Long bbstId);
	
	// 댓글 조회
	public BbstReplyJoinVO readBbstReply(Long bbstReplyId);
	
	// 댓글 수정
	public int updateBbstReply(BbstReplyJoinVO vo);
	
	// 댓글 삭제
	public int deleteBbstReply(Long bbstReplyId);
	
	// 게시글 삭제 시 댓글도 삭제
	public int deleteReplyWithBbst(Long bbstId);
	
	// 게시글의 모든 댓글 조회
	public List<BbstReplyJoinVO> getBbstReplyList(
		@Param("cri") BbstReplyCriteria cri,
		@Param("bbstId") Long bbstId);
	
	// 게시글의 전체 데이터 개수 처리
	public int getReplyCountByBbstId(Long bbstId);
	
	// 마이페이지
	// 내가 쓴 댓글 리스트
	public List<BbstReplyJoinVO> getMyBbstReply(
		@Param("cri") BbstReplyCriteria cri,
		@Param("memberId") Long memberId);
	
	// 내가 쓴 댓글 리스트 - 전체 데이터 개수 처리
	public int getMyBbstReplyTotalCount(Long memberId);
}
