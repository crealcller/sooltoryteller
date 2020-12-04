package com.sooltoryteller.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sooltoryteller.domain.Criteria;
import com.sooltoryteller.domain.MyLikeVO;

public interface LiqLikeMapper {
	
	//좋아요 상태 가져오기 (1->true, 0->false)
	public Integer getCount(@Param("memberId")Long memberId, @Param("liqId") Long liqId);
	
	//좋아요 등록
	public int insert(@Param("memberId")Long memberId, @Param("liqId") Long liqId);
	
	//좋아요 삭제
	public int delete(@Param("memberId")Long memberId, @Param("liqId") Long liqId);
	
	//해당회원이 좋아요한 전통주 리스트
	public List<MyLikeVO> getMyListWithPaging(
						@Param("memberId") Long memberId,
						@Param("cri") Criteria cri); 
	
	//해당회원의 좋아요 총 개수
	public int getCountMemberId(Long memberId);
}
