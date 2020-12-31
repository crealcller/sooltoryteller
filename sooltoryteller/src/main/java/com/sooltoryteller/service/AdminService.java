package com.sooltoryteller.service;

import java.util.List;

import com.sooltoryteller.domain.AdminCriteria;
import com.sooltoryteller.domain.LiqCnVO;
import com.sooltoryteller.domain.LiqCoVO;
import com.sooltoryteller.domain.LiqVO;
import com.sooltoryteller.domain.MemberVO;

public interface AdminService {

	public List<MemberVO> getList(AdminCriteria adCri);

	public int getTotal(AdminCriteria adCri);
	
	public LiqVO getLiq(Long liqId);

	public List<LiqVO> getLiqListWithPaging(AdminCriteria adCri);

	public boolean registerLiq(LiqVO liq, Long liqCoId);

	public boolean removeLiq(Long liqId);

	public boolean modifyLiq(LiqVO liq, LiqCnVO cn);
	
	public boolean removeLiqCo(Long liqCoId);

	public int getliqExist(String liqNm);
	
	public Long checkExistLiqCo(String liqCoNm);
	
	public boolean registerLiqCo(LiqCoVO vo);
	
	public boolean modifyLiqCo(LiqCoVO vo);
	
	public List<LiqCoVO> getLiqCoListWithPaging(AdminCriteria adCri);
	
	public LiqCoVO getLiqCoById(Long liqCoId);

	public int liqCoCnt();
	
	public List<String> coNm();

}
