package com.sooltoryteller.service;

import org.springframework.stereotype.Service;

import com.sooltoryteller.domain.OrdDtlVO;
import com.sooltoryteller.domain.OrdHistVO;
import com.sooltoryteller.domain.OrdVO;
import com.sooltoryteller.domain.OrderDTO;
import com.sooltoryteller.mapper.OrderMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class OrderServiceImpl implements OrderService {

	private OrderMapper mapper;
	
	// 주문 완료 후
	@Override
	// 주문에 데이터 삽입
	public boolean insertOrd(OrderDTO order) {
		log.info("***** insert order");
		return mapper.insertOrd(order) ==1;
	}

	@Override
	// 주문내역에 데이터 삽입
	public OrdDtlVO insertOrdDtl() {
		log.info("***** insert order details");
		return mapper.insertOrdDtl();
	}

	@Override
	// 주문이력에 데이터 삽입
	public OrdHistVO insertOrdHist() {
		log.info("***** insert order history");
		return mapper.insertOrdHist();
	}

	// 각 항목 조회
	@Override
	// 주문 조회
	public int getOrd(Long orderId) {
		int count = mapper.getOrd(orderId);
		log.info("***** get order");
		log.info("***** gerOrd " + count);
		return count;
	}

	@Override
	// 주문내역 조회
	public int getOrdDtl(Long orderId) {
		int count = mapper.getOrdDtl(orderId);
		log.info("***** get order details");
		log.info("***** getOrdDtl " + count);
		return count;
	}

	@Override
	// 주문이력 조회
	public int getOrdHist(Long orderId) {
		int count = mapper.getOrdHist(orderId);
		log.info("***** get order history");
		log.info("***** getOrdHist " + count);
		return count;
	}

	// 결제 완료 후
	@Override
	// 주문의 주문상태 업데이트
	public OrdVO updateOrdStus(Long orderId) {
		log.info("***** update order status");
		return mapper.updateOrdStus(orderId);
	}
}
