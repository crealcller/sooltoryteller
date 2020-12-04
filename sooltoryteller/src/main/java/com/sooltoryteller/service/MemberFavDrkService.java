package com.sooltoryteller.service;

import java.util.List;

import com.sooltoryteller.domain.MemberFavDrkVO;

public interface MemberFavDrkService {
	//선호하는 술 등록
	public void registerFavDrk(Long memberId, String[] arr);

	//선호하는 술 가져오기(회원정보수정)
	public List<Integer> getFavDrk(Long memberId);
	
	//선호하는 술 종류 변경하기
	public boolean modifyFavDrk(Long memberId, int[] drink);



}
