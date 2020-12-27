package com.sooltoryteller.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sooltoryteller.domain.BbstCriteria;
import com.sooltoryteller.domain.LiqVO;
import com.sooltoryteller.mapper.LiqMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class LiqServiceImpl implements LiqService {

	private LiqMapper mapper;

	@Transactional
	@Override
	public LiqVO get(Long liqId) {
		log.info("get" + liqId);
		mapper.updateViewCnt(liqId, 1);
		return mapper.get(liqId);
	}

	@Override
	public List<LiqVO> getLiqListByCate(String cate, BbstCriteria cri) {
		log.info("get liq list by cate");
		cri.setAmount(12);
		return mapper.getLiqListByCate(cate, cri);
	}

	@Override
	public int liqCntByCate(String cate) {
		log.info("liq cnt by cate");
		return mapper.getLiqCntByCate(cate);
	}

	@Override
	public List<LiqVO> getOtherLiq(Long liqId) {
		// TODO Auto-generated method stub
		return mapper.getOtherLiq(liqId);
	}
}
