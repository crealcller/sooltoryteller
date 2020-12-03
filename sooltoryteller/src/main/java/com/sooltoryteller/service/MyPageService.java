package com.sooltoryteller.service;

import java.util.List;

import com.sooltoryteller.domain.MyLikeVO;
import com.sooltoryteller.domain.MyRevwVO;

public interface MyPageService {

	public List<MyRevwVO> getRevwList(Long memberId);
	
	public List<MyLikeVO> getLikeList(Long memberId);
}
