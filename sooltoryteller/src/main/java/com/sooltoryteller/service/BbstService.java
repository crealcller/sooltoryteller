package com.sooltoryteller.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sooltoryteller.domain.BbstCntVO;
import com.sooltoryteller.domain.BbstCriteria;
import com.sooltoryteller.domain.BbstJoinVO;
import com.sooltoryteller.domain.MyBbstPageDTO;
import com.sooltoryteller.domain.MyCntVO;

public interface BbstService {

	// 게시글 등록
	public void registerBbst(BbstJoinVO bbst, BbstCntVO cnt);
	
	// 게시글 조회
	public BbstJoinVO getBbst(Long bbstId);
	
	// 게시글 삭제
	public boolean removeBbst(Long bbstId);
	
	// 게시글 수정
	public boolean modifyBbst(BbstJoinVO bbst);
	
	// 모든 게시글 조회
	public List<BbstJoinVO> getBbstList(BbstCriteria cri);
	
	// 전체 데이터 개수 처리
	public int getBbstTotal(BbstCriteria cri);
	
	// 마이페이지
	// 내 게시글 활동 현황
	public Long[] getMyCnt(Long memberId);
	
	// 내가 쓴 게시글 리스트
	public MyBbstPageDTO getMyBbstList(
		@Param("cri") BbstCriteria cri,
		@Param("memberId") Long memberId);
	
	// 메인페이지 게시글 리스트 - 조회수 높은순
	public List<BbstJoinVO> getBbstByView();
}
