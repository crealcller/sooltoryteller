package com.sooltoryteller.service;

import java.util.List;

import com.sooltoryteller.domain.BasketVO;

public interface BasketService {

	public List<BasketVO> get(Long memberId);
}
