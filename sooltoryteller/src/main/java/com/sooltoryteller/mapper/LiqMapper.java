package com.sooltoryteller.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sooltoryteller.domain.BbstCriteria;
import com.sooltoryteller.domain.LiqVO;

public interface LiqMapper {

	// 전통주 정보
	public LiqVO get(Long liqId);
	
	// 전통주의 주종별 리스트
	public List<LiqVO> getLiqListByCate(@Param("cate") String cate, @Param("cri") BbstCriteria cri);

	// 전통주 주종별 리스트의 개수
	public int getLiqCntByCate(@Param("cate") String cate);

	// 리뷰수 업데이트
	public void updateRevwCnt(@Param("liqId") Long liqId, @Param("amount") int amount);

	// 평균평점 업데이트
	public int updateRevwRate(Long liqId);
	
	// 조회수 업데이트
	public void updateViewCnt(@Param("liqId") Long liqId, @Param("amount") int amount);

	// 좋아요수 업데이트
	public void updateLikeCnt(@Param("liqId") Long liqId, @Param("amount") int amount);
	
	//같은 양조장의 전통주들
	public List<LiqVO> getOtherLiq(Long liqId);
}
