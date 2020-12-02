package com.sooltoryteller.mapper;

import org.apache.ibatis.annotations.Param;

public interface LiqLikeMapper {
	
	//좋아요 상태 가져오기 (1->true, 0->false)
	public Integer getCount(@Param("memberId")Long memberId, @Param("liqId") Long liqId);
	
	//좋아요 등록
	public int insert(@Param("memberId")Long memberId, @Param("liqId") Long liqId);
	
	//좋아요 삭제
	public int delete(@Param("memberId")Long memberId, @Param("liqId") Long liqId);
}
