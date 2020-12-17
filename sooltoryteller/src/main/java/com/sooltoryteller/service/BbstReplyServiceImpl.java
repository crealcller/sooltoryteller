package com.sooltoryteller.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sooltoryteller.domain.BbstReplyCriteria;
import com.sooltoryteller.domain.BbstReplyJoinVO;
import com.sooltoryteller.domain.BbstReplyPageDTO;
import com.sooltoryteller.domain.MyBbstReplyPageDTO;
import com.sooltoryteller.mapper.BbstReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class BbstReplyServiceImpl implements BbstReplyService {

	@Setter(onMethod_ = @Autowired)
	private BbstReplyMapper mapper;

	// 댓글 등록
	@Transactional
	@Override
	public int registerBbstReply(BbstReplyJoinVO vo) {
		log.info("========== REGISTER BBST REPLY ==========");
		// 댓글수 업데이트
		mapper.updateReplyCnt(vo.getBbstId(), 1);
		// 댓글수 가져오기
		mapper.getBbstReplyCnt(vo.getBbstId());
		return mapper.insertBbstReply(vo);
	}

	// 댓글 조회
	@Override
	public BbstReplyJoinVO getBbstReply(Long bbstReplyId) {
		log.info("========== GET BBST REPLY ==========");
		return mapper.readBbstReply(bbstReplyId);
	}

	// 댓글 수정
	@Override
	public int modifyBbstReply(BbstReplyJoinVO vo) {
		log.info("========== MODIFY BBST REPLY ==========");
		return mapper.updateBbstReply(vo);
	}

	// 댓글 삭제
	@Transactional
	@Override
	public int removeBbstReply(
		@Param("bbstReplyId") Long bbstReplyId) {

		log.info("========== REMOVE BBST REPLY ==========");
		BbstReplyJoinVO vo = mapper.readBbstReply(bbstReplyId);
		int result = mapper.deleteBbstReply(bbstReplyId);
		// 댓글수 업데이트
		mapper.updateReplyCnt(vo.getBbstId(), -1);
		// 댓글수 가져오기
		mapper.getBbstReplyCnt(vo.getBbstId());
		return result;
	}

	// 게시글의 모든 댓글 조회
	@Transactional
	@Override
	public List<BbstReplyJoinVO> getBbstReplyList(BbstReplyCriteria cri, Long bbstId) {
		log.info("========== GET BBST REPLY LIST OF BBST " + bbstId + " ==========");
		// 댓글수 가져오기
		mapper.getBbstReplyCnt(bbstId);
		return mapper.getBbstReplyList(cri, bbstId);
	}
	
	// 게시글의 모든 댓글 개수 파악
	@Override
	public BbstReplyPageDTO getBbstReplyListPage(BbstReplyCriteria cri, Long bbstId) {
		return new BbstReplyPageDTO(
			mapper.getReplyCountByBbstId(bbstId),
			mapper.getBbstReplyList(cri, bbstId));
	}
	
	// 마이페이지
	// 내가 쓴 댓글 리스트
	@Override
	public MyBbstReplyPageDTO getMyBbstReply(
		@Param("cri") BbstReplyCriteria cri,
		@Param("memberId") Long memberId) {
		
		return new MyBbstReplyPageDTO(
			mapper.getMyBbstReplyTotalCount(memberId),
			mapper.getMyBbstReply(cri, memberId));
	}
}
