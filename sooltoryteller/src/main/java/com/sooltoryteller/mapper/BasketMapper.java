package com.sooltoryteller.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sooltoryteller.domain.BasketJoinVO;
import com.sooltoryteller.domain.BasketVO;

public interface BasketMapper {

	//현재 회원의 장바구니 리스트
	public List<BasketJoinVO> getList(Long memberId);
	
	//장바구니 등록
	public void insert(BasketVO basket);
	
	//장바구니 삭제
	public int delete(@Param("memberId")Long memberId, @Param("liqId")Long liqId);
	
	//장바구니 수량 변경
	public int update(BasketVO basket);

	//전통주 판매금액 불러오기
	public int getPrice(Long liqId);
	
	//한 상품 불러오기
	public BasketVO get(@Param("memberId")Long memberId, @Param("liqId")Long liqId);
}
