package com.sooltoryteller.service;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sooltoryteller.domain.BbstVO;
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
	public void registerBbst(BbstVO bbst) {
		log.info("========== REGISTER " + bbst + "==========");
		mapper.insertBbstWithKey(bbst);
	}

	// 게시글 조회
	@Override
	public BbstVO getBbst(Long bbstId) {
		log.info("========== GET BBSTID " + bbstId + " ==========");
		return mapper.readBbst(bbstId);
	}

	// 게시글 삭제
	@Override
	public boolean removeBbst(Long bbstId) {
		log.info("========== REMOVE BBSTID: " + bbstId + "==========");
		return mapper.deleteBbst(bbstId) == 1;
	}

	// 게시글 수정
	@Override
	public boolean modifyBbst(BbstVO bbst) {
		log.info("========== MODIFY " + bbst + " ===========");
		return mapper.updateBbst(bbst) == 1;
	}

	// 모든 게시글 조회 (무한스크롤)
	@Override
	public List<BbstVO> getBbstList() {
		log.info("========== GET BBST LIST ==========");
		return mapper.getBbstList();
	}


}
