package com.sooltoryteller.mapper;

import java.util.List;

import com.sooltoryteller.domain.OrderJoinListVO;

public interface OrderMapper {

	// 1. 구매하기 버튼에서 바로 넘어오기
	// 상품 사진, 상품 정보, 주문 수량, 판매자, 배송비, 주문금액 (단가 x 수량)
	public List<OrderJoinListVO> getOrdList();

}
