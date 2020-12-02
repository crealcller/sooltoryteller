package com.sooltoryteller.mapper;

import java.util.List;

import com.sooltoryteller.domain.LiqCnVO;
import com.sooltoryteller.domain.LiqCoVO;
import com.sooltoryteller.domain.LiqVO;

public interface LiqMapper {

	//전통주 정보 
	public LiqVO get(Long liqId);
	
	//전통주 리스트 
	public List<LiqVO> getAll();
	
	//전통주의 주종별 리스트
	public List<LiqVO> getAllByKind(String kind);
	
	//미구현
	public int insertLiq(LiqVO vo);
	
	public int insertLiqCn(LiqCnVO vo);
	
	public int insertLiqCoVO(LiqCoVO vo);
	
}
