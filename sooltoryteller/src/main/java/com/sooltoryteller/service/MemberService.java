package com.sooltoryteller.service;

import java.util.List;

import com.sooltoryteller.domain.MemberVO;

public interface MemberService {
	
	//회원가입 이메일 중복체크
	public int checkEmail(String email);
	
	//회원가입
	public void join(MemberVO member);
	
	//로그인
	public boolean loginCheck(String email, String pwd);
	
	//회원정보 가져오기
	public MemberVO get(String email);
	
	//회원정보 수정
	public boolean modify(MemberVO member);
	
	//회원탈퇴
	public boolean modifyRegStus(String email);
	
	//모든회원 리스트 가져오기
	public List<MemberVO> getList();
	
}