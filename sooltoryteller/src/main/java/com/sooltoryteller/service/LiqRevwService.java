package com.sooltoryteller.service;

import java.util.List;

import com.sooltoryteller.domain.Criteria;
import com.sooltoryteller.domain.LiqRevwPageDTO;
import com.sooltoryteller.domain.LiqRevwVO;
import com.sooltoryteller.domain.MyRevwPageDTO;

public interface LiqRevwService {

	public int register(LiqRevwVO vo);
	
	public LiqRevwVO get(Long revwSeq);
	
	public int modify(LiqRevwVO vo);
	
	public int remove(Long revwSeq);
	
	public List<LiqRevwVO> getList(Long liqSeq, Criteria cri);
	
	public LiqRevwPageDTO getListWtihPaging(Long liqSeq, Criteria cri);
	
	public MyRevwPageDTO getMyListWithPaging(Long memberId, Criteria cri);
}
