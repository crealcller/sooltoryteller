package com.sooltoryteller.mapper;

import org.apache.ibatis.annotations.Param;

public interface BbstLikesMapper {

	// 좋아요
	public int likeBbst(@Param("bbstId") Long bbstId, @Param("memberId") Long memberId);
	
	// 좋아요 취소
	public int cancelLikeBbst(@Param("bbstId") Long bbstId, @Param("memberId") Long memberId);
	
	// 좋아요 상태
	public int bbstLikeStus(@Param("bbstId") Long bbstId, @Param("memberId") Long memberId);
	
	// 게시글 좋아요수
	public int bbstLikeCnt(Long bbstId);
	
	// 마이페이지
	// 내가 좋아요 누른 게시글 리스트
	
}
