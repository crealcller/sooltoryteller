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
		
		public List<LiqVO> getLiqListByCate(String cate, BbstCriteria cri);

		public int liqCntByCate(String cate);
		
		public List<LiqVO> getOtherLiq(Long liqId);
		
		public Long[] getMyLiqCnt(Long memberId);
		
}
