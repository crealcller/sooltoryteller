package com.sooltoryteller.service;

import org.apache.ibatis.annotations.Param;

public interface LiqLikeService {

	public boolean checkLike(@Param("memberId")Long memberId, @Param("liqId") Long liqId);
	
	public boolean like(@Param("memberId")Long memberId, @Param("liqId") Long liqId);
	
	public boolean cancelLike(@Param("memberId")Long memberId, @Param("liqId") Long liqId);
}
