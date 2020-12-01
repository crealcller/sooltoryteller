package com.sooltoryteller.mapper;

import java.util.List;

import com.sooltoryteller.domain.Criteria;
import com.sooltoryteller.domain.LiqCnVO;
import com.sooltoryteller.domain.LiqCoVO;
import com.sooltoryteller.domain.LiqVO;

public interface LiqMapper {

	public LiqVO get(Long liqSeq);
	
	public List<LiqVO> getAll();
	
	public List<LiqVO> getAllByKind(String kind);
	
	//등록 
	public int insertLiq(LiqVO vo);
	
	public int insertLiqCn(LiqCnVO vo);
	
	public int insertLiqCoVO(LiqCoVO vo);
}
