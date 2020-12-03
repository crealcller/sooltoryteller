package com.sooltoryteller.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sooltoryteller.domain.MemberVO;

public interface MemberMapper {

	//회원아이디만 불러오기
	public Long getMemberId(String email);
	
	//회원 전체 불러오기
	public List<MemberVO> getList();
	
	//회원가입시 아이디 중복체크
	public int getEmail(String email);
	
	//회원가입시 회원정보 등록
	public void insert(MemberVO member);
	
	//회원 이력관리
	public void insertHist(MemberVO member);
	
	// 로그인 체크
	public MemberVO getLoginInfo(@Param("email") String email, @Param("pwd") String pwd);

	//회원정보 불러오기
	public MemberVO read(String email);
	
	//회원정보 변경(닉네임, 전화번호, 프로필사진)
	public int updateInfo(MemberVO member);
	
	//비밀번호 꺼내오기
	public String getPwd(String email);
	
	//비밀번호 변경
	public int updatePwd(@Param("email")String email, @Param("pwd")String pwd);
	
	//회원탈퇴
	public int updateRegstus(String email);
}
