package com.sooltoryteller.service;

import java.util.List;

import com.sooltoryteller.domain.AdminCriteria;
import com.sooltoryteller.domain.BbstCriteria;
import com.sooltoryteller.domain.Criteria;
import com.sooltoryteller.domain.LiqCnVO;
import com.sooltoryteller.domain.LiqCntVO;
import com.sooltoryteller.domain.LiqVO;

public interface LiqService {
	
		public LiqVO get(Long liqId);
		
		public List<LiqVO> getAllLiqList(BbstCriteria cri);
		
		public List<LiqVO> getLiqListWithPaging(AdminCriteria adCri);
		
		public List<LiqVO> getLiqListByCate(String cate, BbstCriteria cri);
		
		public boolean registerLiq(LiqVO liq, Long liqCoId);
		
		public boolean removeLiq(Long liqId);
		
		public boolean modify(LiqVO liq, LiqCnVO cn);

		public int liqCnt();
		
		public int liqCntByCate(String cate);
		
		public List<LiqVO> getOtherLiq(Long liqId);
}
