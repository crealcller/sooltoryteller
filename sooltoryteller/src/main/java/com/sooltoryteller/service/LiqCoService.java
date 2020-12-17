package com.sooltoryteller.service;

import java.util.List;

import com.sooltoryteller.domain.AdminCriteria;
import com.sooltoryteller.domain.LiqCoVO;

public interface LiqCoService {

	public Long checkExistLiqCo(String liqCoNm);
	
	public boolean registerLiqCo(LiqCoVO vo);
	
	public List<LiqCoVO> getLiqCoListWithPaging(AdminCriteria adCri);
	
	public LiqCoVO getLiqCoById(Long liqCoId);

	public int liqCoCnt();
}
