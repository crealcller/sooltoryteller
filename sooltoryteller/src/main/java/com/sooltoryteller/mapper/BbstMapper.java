package com.sooltoryteller.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sooltoryteller.domain.BbstCntVO;
import com.sooltoryteller.domain.BbstCriteria;
import com.sooltoryteller.domain.BbstJoinVO;

public interface BbstMapper {

	// 모든 게시글 조회
	public List<BbstJoinVO> getBbstList(BbstCriteria cri);
	
	// 전체 데이터 개수 처리
	public int getBbstTotalCount(BbstCriteria cri);
	
	// 게시글 등록
	public void insertBbstWithKey(BbstJoinVO bbst);
	
	// 게시글 집계 등록
	public void insertBbstCnt(BbstCntVO cnt);
	
	// 게시글 조회
	public BbstJoinVO getBbst(Long bbstId);
	 
	// 게시글 삭제
	public int deleteBbst(Long bbstId);
	
	// 게시글 수정
	public int updateBbst(BbstJoinVO bbst);
	
	// 마이페이지
	// 내가 쓴 게시글 리스트
	public List<BbstJoinVO> getMyBbstList(
		@Param("cri") BbstCriteria cri,
		@Param("memberId") Long memberId);
	
	// 내가 쓴 게시글 리스트 - 전체 데이터 개수 처리
	public int getMyBbstListTotalCount(Long memberId);
}
