package com.sooltoryteller.service;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sooltoryteller.mapper.BbstLikesMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class BbstLikesServiceImpl implements BbstLikesService {

	@Setter(onMethod_ = @Autowired)
	private BbstLikesMapper mapper;
	
	// 좋아요
	@Override
	public boolean likeBbst(@Param("bbstId") Long bbstId, @Param("memberId") Long memberId) {
		log.info("========== LIKE BBST ==========");
		return mapper.likeBbst(bbstId, memberId) == 1;
	}
	
	// 좋아요 취소
	@Override
	public boolean cancelLikeBbst(@Param("bbstId") Long bbstId, @Param("memberId") Long memberId) {
		log.info("========== CANCEL LIKE BBST ==========");
		return mapper.cancelLikeBbst(bbstId, memberId) == 0;
	}
	
	// 좋아요 상태
	@Override
	public boolean bbstLikeStus(@Param("bbstId") Long bbstId, @Param("memberId") Long memberId) {
		log.info("========== BBST LIKE STATUS ==========");
		return mapper.bbstLikeStus(bbstId, memberId) == 1;
	}
	
	// 게시글 좋아요수
	@Override
	public int bbstLikeCnt(Long bbstId) {
		log.info("========== BBST LIKE COUNT ==========");
		return mapper.bbstLikeCnt(bbstId);
	}
	
	// 마이페이지
	// 내가 좋아요 누른 게시글 리스트
	
}
