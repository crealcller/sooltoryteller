package com.sooltoryteller.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sooltoryteller.domain.Criteria;
import com.sooltoryteller.domain.LiqRevwVO;

public interface LiqRevwMapper {

	public int insert(LiqRevwVO vo);
	
	public LiqRevwVO read(Long revwSeq);
	
	public int delete(Long revwSeq);
	
	public int update(LiqRevwVO vo);
	
	public List<LiqRevwVO> getListWithPaging(
						@Param("liqSeq") Long liqSeq,
						@Param("cri") Criteria cri);
	
	public int getCountByLiqSeq(Long liqSeq);
}
