package com.sooltoryteller.mapper;

import java.util.List;

import com.sooltoryteller.domain.BasketVO;

public interface BasketMapper {
	
	public List<BasketVO> get(Long memberId);

}
