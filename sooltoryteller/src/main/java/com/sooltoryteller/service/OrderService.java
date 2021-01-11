package com.sooltoryteller.service;

import com.sooltoryteller.domain.OrdDtlVO;
import com.sooltoryteller.domain.OrdHistVO;
import com.sooltoryteller.domain.OrdVO;

public interface OrderService {

	// 주문 완료 후
	// 주문에 데이터 삽입
	public void insertOrd(OrdVO ord);

	// 주문내역에 데이터 삽입
	public void insertOrdDtl(OrdDtlVO ordDtl);

	// 주문이력에 데이터 삽입
	public void insertOrdHist(OrdHistVO ordHist);

	// 각 항목 조회
	// 주문 조회
	public int getOrd(Long orderId);

	// 주문내역 조회
	public int getOrdDtl(Long orderId);

	// 주문이력 조회
	public int getOrdHist(Long orderId);

	// 결제 완료 후
	// 주문의 주문상태 업데이트
	public boolean updateOrdStus(Long orderId);
}