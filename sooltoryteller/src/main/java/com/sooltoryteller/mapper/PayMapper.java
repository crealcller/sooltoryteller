package com.sooltoryteller.mapper;

import com.sooltoryteller.domain.PayHistVO;
import com.sooltoryteller.domain.PayVO;

public interface PayMapper {

	// 결제 내역 가져오기
	public PayVO get(Long memberId);

	// 결제내역 추가
	public int insert(PayVO pay);

	// 결제내역 업데이트
	public int update(PayVO pay);
	
	// 결제 이력 추가
	public int insertPayHist(PayHistVO payHist);

}
