package com.sooltoryteller.service;

import java.util.List;

import org.springframework.stereotype.Service;


import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

import com.sooltoryteller.domain.BasketJoinVO;
import com.sooltoryteller.domain.BasketVO;
import com.sooltoryteller.mapper.BasketMapper;

@Log4j
@Service
@AllArgsConstructor
public class BasketServiceImpl implements BasketService {

	private BasketMapper mapper;
	
	@Override
	public void register(BasketVO basket) {
		log.info("장바구니 등록! : "+basket);
		
		int qty = basket.getQty();
		int prc = getPrice(basket.getLiqId());
		int amount = qty*prc;
		
		log.info("qty : "+qty+"prc : "+prc+"amount : "+amount);
		
		basket.setAmount(amount);
		
		mapper.insert(basket);
	}

	@Override
	public boolean modify(BasketVO basket) {
		log.info("장바구니 수정! : "+basket);
		
		int qty = basket.getQty();
		int prc = getPrice(basket.getLiqId());
		int amount = qty*prc;
		
		log.info("qty : "+qty+"prc : "+prc+"amount : "+amount);
		
		basket.setAmount(amount);
		return mapper.update(basket) == 1;
	}

	@Override
	public boolean remove(Long memberId, Long liqId) {
		log.info("장바구니 삭제!");
		return mapper.delete(memberId, liqId) == 1;
	}

	@Override
	public List<BasketJoinVO> getList(Long memberId) {
		log.info("장바구니 리스트!!");
		
		if(memberId == null) {
			log.info("장바구니 불러오기 실패");
		}

		return mapper.getList(memberId);
	}

	@Override
	public int getPrice(Long liqId) {
		return mapper.getPrice(liqId);
	}

	@Override
	public BasketVO get(Long memberId, Long liqId) {
		return mapper.get(memberId, liqId);
	}
}
