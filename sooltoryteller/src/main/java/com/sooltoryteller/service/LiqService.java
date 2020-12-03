package com.sooltoryteller.service;

import java.util.List;

import com.sooltoryteller.domain.LiqVO;

public interface LiqService {
	
		public LiqVO get(Long liqSeq);
		
		public List<LiqVO> getLiqList();
		
		public List<LiqVO> getLiqListByKind(String kind);
		
}
