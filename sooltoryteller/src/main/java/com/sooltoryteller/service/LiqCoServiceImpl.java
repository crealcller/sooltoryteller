package com.sooltoryteller.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sooltoryteller.domain.AdminCriteria;
import com.sooltoryteller.domain.LiqCoVO;
import com.sooltoryteller.mapper.LiqCoMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class LiqCoServiceImpl implements LiqCoService{

	@Setter(onMethod_ =@Autowired )
	private LiqCoMapper mapper;
	
	@Override
	public Long checkExistLiqCo(String liqCoNm) {
		
		log.info("check liq co exist");
		return mapper.getLiqCoId(liqCoNm);
	}
	
	@Override
	public boolean registerLiqCo(LiqCoVO vo) {
		log.info("register liq co");
		return mapper.insertLiqCo(vo)==1;
	}

	@Override
	public List<LiqCoVO> getLiqCoListWithPaging(AdminCriteria adCri) {
		log.info("get liq co list");
		return mapper.getLiqCoListWithPaging(adCri);
	}

	@Override
	public LiqCoVO getLiqCoById(Long liqCoId) {
		log.info("get liq co");
		
		return mapper.getLiqCoById(liqCoId);
	}

	@Override
	public int liqCoCnt() {
		log.info("get liq co cnt");
		return mapper.liqCoCnt();
	}
}
