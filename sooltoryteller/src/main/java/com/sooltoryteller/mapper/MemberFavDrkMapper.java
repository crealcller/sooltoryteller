package com.sooltoryteller.mapper;


import java.util.List;

import com.sooltoryteller.domain.MemberFavDrkVO;

public interface MemberFavDrkMapper {

	//회원 가입시 회원의 선호하는 술 등록
	public void insert(MemberFavDrkVO memberFavDrk);
	
	//회원의 선호하는 술(id) 가져오기
	public List<Integer> get(Long memberId);
	
	//선호하는 술 일련번호(시퀀스) 가져오기
	public List<Long> getFavDrkId(Long memberId);
	
	//회원의 선호하는 술 변경하기
	public int updateFavDrk(MemberFavDrkVO memberFavDrk);
	
	//선호하는 술 종류(이름)가져오기
	public List<String> getFavList(Long memberId);
	
	//회원정보 수정시 변경할 선호하는 술 이름 가져오기
	public String getFavNameList(int drkCdId);
	
	//선호하는 술 통계
	public int getFavCnt(int drkCdId);
}
