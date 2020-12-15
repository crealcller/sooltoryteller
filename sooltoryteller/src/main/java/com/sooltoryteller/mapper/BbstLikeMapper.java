package com.sooltoryteller.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sooltoryteller.domain.BbstLikeCriteria;
import com.sooltoryteller.domain.BbstLikeJoinVO;

public interface BbstLikeMapper {

	// 좋아요
	public int likeBbst(
		@Param("bbstId") Long bbstId,
		@Param("memberId") Long memberId);
	
	// 좋아요 취소
	public int cancelLikeBbst(
		@Param("bbstId") Long bbstId,
		@Param("memberId") Long memberId);
	
	// 좋아요 상태
	public int bbstLikeStus(
		@Param("bbstId") Long bbstId,
		@Param("memberId") Long memberId);
	
	// 게시글 좋아요수 업데이트
	public void updateBbstLikeCnt(
		@Param("bbstId") Long bbstId,
		@Param("cnt") int cnt);
	
	// 게시글 좋아요수
	public int bbstLikeCnt(Long bbstId);
	
	// 마이페이지
	// 내가 좋아요 누른 게시글 리스트
	public List<BbstLikeJoinVO> getMyBbstLike(
		@Param("cri") BbstLikeCriteria cri,
		@Param("memberId") Long memberId);
	
	// 내가 좋아요 누른 게시글 리스트 - 전체 데이터 개수 처리
	public int getMyBbstLikeTotalCount(Long memberId);
}
