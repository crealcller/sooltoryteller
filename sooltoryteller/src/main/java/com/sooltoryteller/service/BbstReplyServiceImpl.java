package com.sooltoryteller.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sooltoryteller.domain.BbstReplyCriteria;
import com.sooltoryteller.domain.BbstReplyMemberJoinVO;
import com.sooltoryteller.domain.BbstReplyPageDTO;
import com.sooltoryteller.mapper.BbstReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class BbstReplyServiceImpl implements BbstReplyService {

	@Setter(onMethod_ = @Autowired)
	private BbstReplyMapper mapper;

	// 댓글 등록
	@Override
	public int registerBbstReply(BbstReplyMemberJoinVO vo) {
		log.info("========== REGISTER BBST REPLY ==========");
		return mapper.insertBbstReply(vo);
	}

	// 댓글 조회
	@Override
	public BbstReplyMemberJoinVO getBbstReply(Long bbstReplyId) {
		log.info("========== GET BBST REPLY ==========");
		return mapper.readBbstReply(bbstReplyId);
	}

	// 댓글 수정
	@Override
	public int modifyBbstReply(BbstReplyMemberJoinVO vo) {
		log.info("========== MODIFY BBST REPLY ==========");
		return mapper.updateBbstReply(vo);
	}

	// 댓글 삭제
	@Override
	public int removeBbstReply(Long bbstReplyId) {
		log.info("========== REMOVE BBST REPLY ==========");
		return mapper.deleteBbstReply(bbstReplyId);
	}

	// 게시글의 모든 댓글 조회
	@Override
	public List<BbstReplyMemberJoinVO> getBbstReplyList(BbstReplyCriteria cri, Long bbstId) {
		log.info("========== GET BBST REPLY LIST OF BBST " + bbstId + " ==========");
		return mapper.getBbstReplyList(cri, bbstId);
	}
	
	// 게시글의 모든 댓글 개수 파악
	@Override
	public BbstReplyPageDTO getBbstReplyListPage(BbstReplyCriteria cri, Long bbstId) {
		return new BbstReplyPageDTO(
			mapper.getReplyCountByBbstId(bbstId),
			mapper.getBbstReplyList(cri, bbstId));
	}
}
