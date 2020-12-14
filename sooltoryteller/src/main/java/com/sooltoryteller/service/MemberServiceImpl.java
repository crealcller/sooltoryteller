package com.sooltoryteller.service;

import java.util.List;
import java.util.UUID;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.sooltoryteller.domain.MemberVO;
import com.sooltoryteller.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService{
	
	private MemberMapper mapper;
	
	//@Inject
	//PasswordEncoder PasswordEncoder;  //BCryptPasswordEncoder
	
	@Override
	public boolean join(MemberVO member) {
		int result = 0;
		
		if(member != null) {
			//중복된 이메일, 중복된 닉네임이 있다면
			if(checkEmail(member.getEmail()) >=1 || checkName(member.getName())>=1) {
				return false;
			}
		//String encPwd = PasswordEncoder.encode(member.getPwd());
		//member.setPwd(encPwd);
		//System.out.println("암호화된 비번 : " + encPwd);
		
		result = mapper.insert(member);
		mapper.insertHist(mapper.read(member.getEmail()));
		
	}
		return result == 1;
	}

	@Override
	public boolean loginCheck(String email, String pwd) {

		MemberVO member = mapper.getLoginInfo(email, pwd);
		
		if(member == null) {
			return false;
		}else {
			
			return true;
		}
	}

	@Override
	public MemberVO get(String email) {
		log.info("get...."+email);
		return mapper.read(email);
		
	}

	@Override
	public boolean modify(MemberVO member) {
		log.info("modify..."+member);
		
		if(mapper.updateInfo(member) == 1) {
			mapper.insertHist(mapper.read(member.getEmail()));
			return true;
		}
		return false;
	}

	@Override
	public List<MemberVO> getList() {
		log.info("getList.....");
		return mapper.getList();
	}

	@Override
	public boolean modifyRegStus(String email) {

		return mapper.updateRegstus(email) == 1;
	}

	@Override
	public int checkEmail(String email) {
		
		return mapper.checkEmail(email);
	}

	@Override
	public String getPwd(String email) {
		
		String pwd = "";

		if(email != null) {
			pwd = mapper.getPwd(email);
		}
		
		return pwd;
	}

	@Override
	public boolean modifyPwd(String email, String pwd) {
		
		if(mapper.updatePwd(email, pwd) ==1) {
			mapper.insertHist(mapper.read(email));
			return true;
		}
		
		return false;
	}

	@Override
	public Long getMemberId(String email) {
		return mapper.getMemberId(email);
	}

	@Override
	public int checkName(String name) {
		
		return mapper.checkName(name);
	}
	
	// 수빈
	// 회원 아이디 & 닉네임 불러오기
	@Override
	public MemberVO getMemberIdName(String email) {
		log.info("========== GET MEMBER ID & NAME : " + mapper.getMemberIdName(email) + " ==========");
		return mapper.getMemberIdName(email);
	}

	@Override
	public String getEmail(Long memberId) {
		
		return mapper.getEmail(memberId);
	}

}
