package com.sooltoryteller.mapper;

import java.util.List;

import com.sooltoryteller.domain.MyLikeVO;
import com.sooltoryteller.domain.MyRevwVO;

public interface MyPageMapper {

	//해당회원이 작성한리뷰
	public List<MyRevwVO> getRevwList(Long memberId);
	
	//해당회원이 좋아요한 전통주 리스트
	public List<MyLikeVO> getLikeList(Long memberId);
}
