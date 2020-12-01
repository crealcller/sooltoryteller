package com.sooltoryteller.service;

import java.util.List;

import com.sooltoryteller.domain.Criteria;
import com.sooltoryteller.domain.LiqRevwPageDTO;
import com.sooltoryteller.domain.LiqRevwVO;

public interface LiqRevwService {

	public int register(LiqRevwVO vo);
	
	public LiqRevwVO get(Long revwSeq);
	
	public int modify(LiqRevwVO vo);
	
	public int remove(Long revwSeq);
	
	public List<LiqRevwVO> getList(Long liqSeq, Criteria cri);
	
	public LiqRevwPageDTO getListPage(Long liqSeq, Criteria cri);
}
