package com.sooltoryteller.mapper;

import java.util.List;

import com.sooltoryteller.domain.BbstVO;

public interface BbstMapper {

	// 모든 게시글 조회 (무한스크롤) 
	public List<BbstVO> getBbstList();
	
	// 게시글 등록
	public void insertBbstWithKey(BbstVO bbst);
	
	// 게시글 조회
	public BbstVO readBbst(Long bbstId);
	
	// 게시글 삭제
	public int deleteBbst(Long bbstId);
	
	// 게시글 수정
	public int updateBbst(BbstVO bbst);
	
}
