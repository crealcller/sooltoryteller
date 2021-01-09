package com.sooltoryteller.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sooltoryteller.domain.OrderJoinVO;
import com.sooltoryteller.mapper.OrderMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class OrderServiceImpl implements OrderService {

	@Setter(onMethod_ = @Autowired)
	private OrderMapper order;
	
	// 1. 구매하기 버튼에서 바로 넘어오기
	// 상품 사진, 상품 정보, 주문 수량, 판매자, 배송비, 주문금액 (단가 x 수량)
//	@Override
//	public OrderJoinVO getOneLiqInfo(Long liqId) {
//		log.info("구매하기 버튼에서 바로 넘어오기");
//		return order.getOneLiqInfo(liqId);
//	}
	
	
}
