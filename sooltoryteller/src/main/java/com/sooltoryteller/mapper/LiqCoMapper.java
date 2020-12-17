package com.sooltoryteller.mapper;

import java.util.List;

import com.sooltoryteller.domain.AdminCriteria;
import com.sooltoryteller.domain.LiqCoVO;

public interface LiqCoMapper {
	
	//양조장이름으로 양조장아이디 찾기
	public Long getLiqCoId(String liqCoNm);
	
	//양조장 등록
	public int insertLiqCo(LiqCoVO co);
	
	//모든 양조장 리스트
	public List<LiqCoVO> getLiqCoListWithPaging(AdminCriteria adCri);
	
	//양조장아이디로 양조장 정보가져오기
	public LiqCoVO getLiqCoById(Long liqCoId);
	
	public int liqCoCnt();
		
}
