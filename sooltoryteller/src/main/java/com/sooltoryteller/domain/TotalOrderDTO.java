package com.sooltoryteller.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;

@Data
@AllArgsConstructor
@Getter
@Builder
// 주문 전체 내역
public class TotalOrderDTO {

	// 주문 리스트에서 데이터 뽑기
	private List<OrderJoinVO> ordList;
	
	// 상품 정보 리스트
	private List<OrderJoinVO> liqNmList;
	
	// 주문 총수량
	private int ttlQty;
	
	// 주문 총금액
	private int ttlPrc;

	// 주문 리스트에서
	public TotalOrderDTO(List<OrderJoinVO> ordList, int ttlQty, int ttlPrc) {
		for(int i = 0; i < ordList.size(); i++) {
			// 주문 수량 뽑아서 주문 총수량 구하기
			this.ttlQty += ordList.get(i).getOrdQty();
			// 주문 총금액 += 주문 단가 * 주문 수량
			this.ttlPrc += ordList.get(i).getPrc() * ordList.get(i).getOrdQty();
		}
	}
	
	public TotalOrderDTO toEntity() {
		return TotalOrderDTO.builder()
			.liqNmList(liqNmList)
			.ttlQty(ttlQty)
			.ttlPrc(ttlPrc)
			.build();
	}
}
