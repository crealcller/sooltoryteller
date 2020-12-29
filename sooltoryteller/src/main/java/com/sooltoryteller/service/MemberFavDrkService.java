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

	//회원의 선호하는 술 목록 가져오기
	public List<String> getFavList(Long memberId);
	
	//회원정보 수정시 변경할 선호하는 술 이름 가져오기
	public String[] getFavNameList(int[] arr);
	
	//선호한는 술 통계
	public int[] getFavCnt(int[] arr);

}
