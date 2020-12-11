package com.sooltoryteller.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sooltoryteller.domain.LiqCnVO;
import com.sooltoryteller.domain.LiqCoVO;
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
		log.info("get..."+liqId);
		mapper.updateViewCnt(liqId, 1);
		return mapper.get(liqId);
	}

	@Override
	public List<LiqVO> getLiqList() {
		log.info("getAll....");
		return mapper.getLiqList();
	}

	@Override
	public List<LiqVO> getLiqListByKind(String kind) {
		
		return mapper.getLiqListByKind(kind);
	}

	@Override
	public boolean checkExistLiqCo(String liqCoNm) {
		
		log.info("check liq co exist");
		return mapper.getLiqCoCnt(liqCoNm)==1;
	}
	
	@Override
	public boolean registerLiqCo(LiqCoVO vo) {
		log.info("register liq co");
		return mapper.insertLiqCo(vo)==1;
	}

	

}
