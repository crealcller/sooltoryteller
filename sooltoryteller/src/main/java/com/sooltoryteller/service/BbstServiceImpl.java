package com.sooltoryteller.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sooltoryteller.domain.BbstCntVO;
import com.sooltoryteller.domain.BbstCriteria;
import com.sooltoryteller.domain.BbstJoinVO;
import com.sooltoryteller.domain.MyBbstPageDTO;
import com.sooltoryteller.mapper.BbstLikeMapper;
import com.sooltoryteller.mapper.BbstMapper;
import com.sooltoryteller.mapper.BbstReplyMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BbstServiceImpl implements BbstService {

	@Setter(onMethod_ = @Autowired)
	private BbstMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private BbstLikeMapper likeMapper;
	
	@Setter(onMethod_ = @Autowired)
	private BbstReplyMapper replyMapper;

	// 게시글 등록
	@Transactional
	@Override
	public void registerBbst(BbstJoinVO bbst, BbstCntVO cnt) {
		log.info("========== REGISTER " + bbst + "==========");
		mapper.insertBbstWithKey(bbst);
		// 게시글 집계 등록
		mapper.insertBbstCnt(cnt);
	}
	
	// 게시글 조회
	@Transactional
	@Override
	public BbstJoinVO getBbst(Long bbstId) {
		log.info("========== GET BBSTID " + bbstId + " ==========");
		// 조회 시 조회수 +1
		mapper.updateViewCnt(bbstId, 1);
		// 댓글수 가져오기
		
		// 좋아요수 가져오기
		likeMapper.getBbstLikeCnt(bbstId);
		return mapper.getBbst(bbstId);
	}
	
	// 게시글 삭제
	@Transactional
	@Override
	public boolean removeBbst(Long bbstId) {
		log.info("========== REMOVE BBSTID: " + bbstId + "==========");
		// 게시글 삭제 시 댓글도 삭제
		replyMapper.deleteReplyWithBbst(bbstId);
		return mapper.deleteBbst(bbstId) == 1;
	}

	// 게시글 수정
	@Override
	public boolean modifyBbst(BbstJoinVO bbst) {
		log.info("========== MODIFY " + bbst + " ===========");
		return mapper.updateBbst(bbst) == 1;
	}

	// 모든 게시글 조회
	@Override
	public List<BbstJoinVO> getBbstList(BbstCriteria cri) {
		log.info("========== GET BBST LIST ==========");
		return mapper.getBbstList(cri);
	}
	
	// 전체 데이터 개수 처리
	@Override
	public int getBbstTotal(BbstCriteria cri) {
		log.info("========== GET TOTAL COUNT ==========");
		return mapper.getBbstTotalCount(cri);
	}
	
	// 마이페이지
	// 내가 쓴 게시글 리스트
	@Override
	public MyBbstPageDTO getMyBbstList(
		@Param("cri") BbstCriteria cri,
		@Param("memberId") Long memberId) {
		
		log.info("========== GET MY BBST LIST ==========");
		return new MyBbstPageDTO(
			mapper.getMyBbstListTotalCount(memberId),
			mapper.getMyBbstList(cri, memberId));
	}
}
