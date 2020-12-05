package com.sooltoryteller.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sooltoryteller.domain.BbstCriteria;
import com.sooltoryteller.domain.BbstMemberJoinVO;
import com.sooltoryteller.mapper.BbstMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BbstServiceImpl implements BbstService {

	@Setter(onMethod_ = @Autowired)
	private BbstMapper mapper;

	// 게시글 등록
	@Override
	public void registerBbst(BbstMemberJoinVO bbst) {
		log.info("========== REGISTER " + bbst + "==========");
		mapper.insertBbstWithKey(bbst);
	}

	// 게시글 조회
	@Override
	public BbstMemberJoinVO getBbst(Long bbstId) {
		log.info("========== GET BBSTID " + bbstId + " ==========");
		return mapper.getBbst(bbstId);
	}

	// 게시글 삭제
	@Override
	public boolean removeBbst(Long bbstId) {
		log.info("========== REMOVE BBSTID: " + bbstId + "==========");
		return mapper.deleteBbst(bbstId) == 1;
	}

	// 게시글 수정
	@Override
	public boolean modifyBbst(BbstMemberJoinVO bbst) {
		log.info("========== MODIFY " + bbst + " ===========");
		return mapper.updateBbst(bbst) == 1;
	}

	// 모든 게시글 조회
	@Override
	public List<BbstMemberJoinVO> getBbstList(BbstCriteria cri) {
		log.info("========== GET BBST LIST ==========");
		return mapper.getBbstList(cri);
	}
	
	// 전체 데이터 개수 처리
	@Override
	public int getBbstTotal(BbstCriteria cri) {
		log.info("========== GET TOTAL COUNT ==========");
		return mapper.getBbstTotalCount(cri);
	}
}
