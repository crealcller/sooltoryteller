package com.sooltoryteller.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sooltoryteller.domain.Criteria;
import com.sooltoryteller.domain.LiqCnVO;
import com.sooltoryteller.domain.LiqCoVO;
import com.sooltoryteller.domain.LiqVO;

public interface LiqMapper {

	//전통주 정보 
	public LiqVO get(Long liqId);
	
	//전통주 전체 리스트 
	public List<LiqVO> getLiqList();
	
	//전통주 전체 리스트의 개수
	public int getCountLiqList();
	
	public List<LiqVO> getLiqListWithPaging(Criteria cri);
	
	//전통주의 주종별 리스트
	public List<LiqVO> getLiqListByKind(String kind);
	
	public List<LiqVO> getLiqListByKindWithPaing(
			@Param("kind") String kind,
			@Param("cri") Criteria cri);
	
	//전통주 주종별 리스트의 개수
	public int getCountLiqListByKind(String kind);
		
	//미구현
	public int insertLiq(LiqVO vo);
	
	public int insertLiqCn(LiqCnVO vo);
	
	public int insertLiqCoVO(LiqCoVO vo);
	
}
