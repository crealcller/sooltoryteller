package com.sooltoryteller.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sooltoryteller.domain.AdminCriteria;
import com.sooltoryteller.domain.LiqCnVO;
import com.sooltoryteller.domain.LiqCntVO;
import com.sooltoryteller.domain.LiqVO;
import com.sooltoryteller.mapper.LiqMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class LiqServiceImpl implements LiqService{

	private LiqMapper mapper;
	
	@Transactional
	@Override
	public LiqVO get(Long liqId) {
		log.info("get"+liqId);
		mapper.updateViewCnt(liqId, 1);
		return mapper.get(liqId);
	}

	@Override
	public List<LiqVO> getLiqListWithPaging(AdminCriteria adCri) {
		log.info("get all liq list");
		return mapper.getLiqListWithPaging(adCri);
	}

	@Override
	public List<LiqVO> getLiqListByKind(String kind) {
		log.info("get liq list by kind");
		return mapper.getLiqListByKind(kind);
	}

	

	@Override
	@Transactional
	public boolean registerLiq(LiqVO liq, LiqCnVO cn, Long liqCoId, LiqCntVO cnt) {
		log.info("register liq with liq cn");
		
		int liqResult = mapper.insertLiq(liq, liqCoId);
		int cnResult = mapper.insertLiqCn(cn);
		int cntResult = mapper.insertLiqCnt(cnt);
		
		if(liqResult==1&&cnResult==1&&cntResult==1) {
			return true;
		}
		return false;
	}

	@Override
	@Transactional
	public boolean removeLiq(Long liqId) {
		
		int liqResult = mapper.deleteLiq(liqId);
		int cnResult = mapper.deleteLiqCn(liqId);
		int cntResult = mapper.deleteLiqCnt(liqId);
		
		if(liqResult==1&&cnResult==1&&cntResult==1) {
			return true;
		}
		return false;
	}

	@Transactional 
	@Override
	public boolean modify(LiqVO liq, LiqCnVO cn) {
		int liqResult = mapper.update(liq);
		int cnResult = mapper.updateCn(cn);
		if(liqResult==1&&cnResult==1) {
			return true;
		}
		return false;
	}

	@Override
	public List<LiqVO> getLiqList() {
		return mapper.getLiqList();
	}

	@Override
	public int liqCnt() {
		log.info("liq cnt");
		return mapper.liqCnt();
	}
}
