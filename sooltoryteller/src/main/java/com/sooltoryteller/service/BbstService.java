package com.sooltoryteller.service;

import java.util.List;

import com.sooltoryteller.domain.BbstCriteria;
import com.sooltoryteller.domain.BbstMemberJoinVO;

public interface BbstService {

	// 게시글 등록
	public void registerBbst(BbstMemberJoinVO bbst);
	
	// 게시글 조회
	public BbstMemberJoinVO getBbst(Long bbstId);
	
	// 게시글 삭제
	public boolean removeBbst(Long bbstId);
	
	// 게시글 수정
	public boolean modifyBbst(BbstMemberJoinVO bbst);
	
	// 모든 게시글 조회
	public List<BbstMemberJoinVO> getBbstList(BbstCriteria cri);
	
	// 전체 데이터 개수 처리
	public int getBbstTotal(BbstCriteria cri);
	
}