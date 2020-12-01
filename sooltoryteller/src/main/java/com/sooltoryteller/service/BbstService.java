package com.sooltoryteller.service;

import java.util.List;

import com.sooltoryteller.domain.BbstVO;

public interface BbstService {

	// 게시글 등록
	public void registerBbst(BbstVO bbst);
	
	// 게시글 조회
	public BbstVO getBbst(Long bbstId);
	
	// 게시글 삭제
	public boolean removeBbst(Long bbstId);
	
	// 게시글 수정
	public boolean modifyBbst(BbstVO bbst);
	
	// 모든 게시글 조회 (무한스크롤)
	public List<BbstVO> getBbstList();
	
}
