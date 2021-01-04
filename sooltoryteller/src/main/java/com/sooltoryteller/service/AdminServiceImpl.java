package com.sooltoryteller.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sooltoryteller.domain.AdminCriteria;
import com.sooltoryteller.domain.LiqCnVO;
import com.sooltoryteller.domain.LiqCntVO;
import com.sooltoryteller.domain.LiqCoVO;
import com.sooltoryteller.domain.LiqVO;
import com.sooltoryteller.domain.MemberVO;
import com.sooltoryteller.mapper.AdminMapper;
import com.sooltoryteller.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class AdminServiceImpl implements AdminService {

	private AdminMapper mapper;

	// 모든 회원 불러오기(페이징처리)
	@Override
	public List<MemberVO> getList(AdminCriteria adCri) {
		log.info("get List with criteria: " + adCri);
		return mapper.getListWithPaging(adCri);
	}

	@Override
	public int getTotal(AdminCriteria adCri) {
		log.info("get total count");
		return mapper.getTotalCount(adCri);
	}

	@Override
	@Transactional
	public boolean registerLiq(LiqVO liq, Long liqCoId) {
		log.info("register liq with liq cn and liq cnt");

		int liqResult = mapper.insertLiq(liq, liqCoId);

		LiqCnVO cn = liq.getLiqCn();
		LiqCntVO cnt = liq.getLiqCnt();
		cnt.setInqrCnt(0L);
		int cnResult = mapper.insertLiqCn(cn);
		int cntResult = mapper.insertLiqCnt(cnt);

		if (liqResult == 1 && cnResult == 1 && cntResult == 1) {
			return true;
		}
		return false;
	}

	@Override
	public LiqVO getLiq(Long liqId) {
		return mapper.get(liqId);
	}

	@Override
	public List<LiqVO> getLiqListWithPaging(AdminCriteria adCri) {
		log.info("get all liq list");
		return mapper.getLiqListWithPaging(adCri);
	}

	@Transactional
	@Override
	public boolean modifyLiq(LiqVO liq) {
		int liqResult = mapper.updateLiq(liq);
		LiqCnVO cn = liq.getLiqCn();
		cn.setLiqId(liq.getLiqId());
		int cnResult = mapper.updateCn(cn);
		if (liqResult == 1 && cnResult == 1) {
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

		if (liqResult == 1 && cnResult == 1 && cntResult == 1) {
			return true;
		}
		return false;
	}

	@Override
	public int getliqExist(String liqNm) {

		return mapper.getliqExist(liqNm);
	}
	
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
	public boolean modifyLiqCo(LiqCoVO vo) {
		log.info("update liq co");
		return mapper.updateLiqCo(vo)==1;
	}
	
	@Override
	public boolean removeLiqCo(Long liqCoId) {
		log.info("remove liq co");
		return mapper.deleteLiqCo(liqCoId)==1;
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

	@Override
	public List<String> coNm() {
		log.info("get co nm");
		return mapper.getCoNm();
	}

}
