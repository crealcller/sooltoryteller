package com.sooltoryteller.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sooltoryteller.domain.Criteria;
import com.sooltoryteller.domain.LiqRevwVO;

public interface LiqRevwMapper {

	public int insert(LiqRevwVO vo);
	
	public LiqRevwVO read(Long revwId);
	
	public int delete(Long revwId);
	
	public int update(LiqRevwVO vo);
	
	public List<LiqRevwVO> getListWithPaging(
						@Param("liqId") Long liqId,
						@Param("cri") Criteria cri);
	
	public int getCountByLiqId(Long liqId);
}
