package com.sooltoryteller.service;

import com.sooltoryteller.domain.Criteria;
import com.sooltoryteller.domain.MyLikePageDTO;

public interface LiqLikeService {

	public boolean checkLike(Long memberId, Long liqId);
	
	public boolean like(Long memberId, Long liqId);
	
	public boolean cancelLike(Long memberId, Long liqId);
	
	public MyLikePageDTO getMyListWithPaging(Long memberId, Criteria cri);
}
