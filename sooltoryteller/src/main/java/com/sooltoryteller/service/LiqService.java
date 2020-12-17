package com.sooltoryteller.service;

import java.util.List;

import com.sooltoryteller.domain.AdminCriteria;
import com.sooltoryteller.domain.LiqCnVO;
import com.sooltoryteller.domain.LiqCntVO;
import com.sooltoryteller.domain.LiqVO;

public interface LiqService {
	
		public LiqVO get(Long liqId);
		
		public List<LiqVO> getLiqList();
		
		public List<LiqVO> getLiqListWithPaging(AdminCriteria adCri);
		
		public List<LiqVO> getLiqListByKind(String kind);
		
		public boolean registerLiq(LiqVO liq, LiqCnVO cn, Long liqCoId, LiqCntVO cnt);
		
		public boolean removeLiq(Long liqId);
		
		public boolean modify(LiqVO liq, LiqCnVO cn);

		public int liqCnt();
}
