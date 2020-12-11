package com.sooltoryteller.service;

import java.util.List;

import com.sooltoryteller.domain.LiqCnVO;
import com.sooltoryteller.domain.LiqCoVO;
import com.sooltoryteller.domain.LiqVO;

public interface LiqService {
	
		public LiqVO get(Long liqId);
		
		public List<LiqVO> getLiqList();
		
		public List<LiqVO> getLiqListByKind(String kind);
		
		public boolean checkExistLiqCo(String liqCoNm);
		
		public boolean registerLiqCo(LiqCoVO vo);
}
