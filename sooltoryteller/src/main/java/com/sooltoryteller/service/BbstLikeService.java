package com.sooltoryteller.service;

import org.apache.ibatis.annotations.Param;

import com.sooltoryteller.domain.BbstLikeCriteria;
import com.sooltoryteller.domain.MyBbstLikePageDTO;

public interface BbstLikeService {

	// 좋아요
	public boolean likeBbst(
		@Param("bbstId") Long bbstId,
		@Param("memberId") Long memberId);
	
	// 좋아요 취소
	public boolean cancelLikeBbst(
		@Param("bbstId") Long bbstId,
		@Param("memberId") Long memberId);
	
	// 좋아요 상태
	public boolean bbstLikeStus(
		@Param("bbstId") Long bbstId,
		@Param("memberId") Long memberId);
	
	// 게시글 좋아요수
	public int bbstLikeCnt(Long bbstId);
	
	// 마이페이지
	// 내가 좋아요 누른 게시글 리스트
	public MyBbstLikePageDTO getMyBbstLike(
		@Param("cri") BbstLikeCriteria cri,
		@Param("memberId") Long memberId);
}
