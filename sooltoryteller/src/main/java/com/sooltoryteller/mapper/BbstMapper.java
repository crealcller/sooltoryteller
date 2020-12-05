package com.sooltoryteller.mapper;

import java.util.List;

import com.sooltoryteller.domain.BbstCriteria;
import com.sooltoryteller.domain.BbstMemberJoinVO;

public interface BbstMapper {

	// 모든 게시글 조회
	public List<BbstMemberJoinVO> getBbstList(BbstCriteria cri);
	
	// 전체 데이터 개수 처리
	public int getBbstTotalCount(BbstCriteria cri);
	
	// 게시글 등록
	public void insertBbstWithKey(BbstMemberJoinVO bbst);
	
	// 게시글 조회
	public BbstMemberJoinVO getBbst(Long bbstId);
	
	// 게시글 삭제
	public int deleteBbst(Long bbstId);
	
	// 게시글 수정
	public int updateBbst(BbstMemberJoinVO bbst);
	
}
