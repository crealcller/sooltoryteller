package com.sooltoryteller.service;


import java.util.List;

import com.sooltoryteller.domain.BasketJoinVO;
import com.sooltoryteller.domain.BasketVO;

public interface BasketService {

	//장바구니 등록
	public void register(BasketVO basket);
	
	//장바구니 수량 변경
	public boolean modify(BasketVO basket);
	
	//장바구니 삭제
	public boolean remove(Long memberId, Long liqId);
	
	//장바구니 리스트
	public List<BasketJoinVO> getList(Long memberId);
}
