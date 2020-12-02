package com.sooltoryteller.service;

import java.util.List;

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
	
	@Override
	public void join(MemberVO member) {
		
		log.info("register...");
		mapper.insert(member);
		mapper.insertHist(mapper.read(member.getEmail()));
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
		
		return mapper.getEmail(email);
	}

	@Override
	public String getPwd(String email) {
		
		return mapper.getPwd(email);
	}

	@Override
	public boolean modifyPwd(String email, String pwd) {
		
		if(mapper.updatePwd(email, pwd) ==1) {
			mapper.insertHist(mapper.read(email));
			return true;
		}
		
		return false;
	}

}
