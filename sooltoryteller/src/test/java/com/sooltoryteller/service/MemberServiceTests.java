package com.sooltoryteller.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sooltoryteller.domain.MemberVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberServiceTests {

	@Setter(onMethod_ = {@Autowired})
	private MemberService service;
	
//	@Test
//	public void testExist() {
//		
//		log.info(service);
//		assertNotNull(service);
//	}
	
	@Test
	public void testJoin() {
		
		MemberVO member = new MemberVO();
		member.setEmail("ccc@ccc.com");
		member.setName("씨씨씨");
		member.setPwd("TlTl!!");
		member.setTelno("01044444444");
		
		System.out.println("회원가입!! : "+service.join(member));
	}
	
//	@Test
	public void testGetList() {
		service.getList().forEach(member-> log.info(member));
	}
	
//	@Test
	public void testGet() {
		log.info(service.get("aaa@aaa.com"));
	}
	
//	@Test
	public void testUpdateInfo() {
		MemberVO member = service.get("aaa@aaa.com");
		
		if(member == null) {
			return;
		}
		
		member.setName("test000");
		log.info("update..."+service.modify(member));
	}
	
//	@Test
	public void testUpdateStus() {
		
		service.modifyRegStus("gustn@gustn.com");
	}
	
	@Test
	public void testLogin() {
		System.out.println("로그인 성공? : "+service.loginCheck("ccc@ccc.com", "apdl!!"));
		
	}
	
//	@Test
	public void testCheckEmail() {
		log.info(service.checkEmail("aaa@aaa.com"));
	}
	
//	@Test
	public void testGetPwd() {
		System.out.println(service.getPwd("gustn@gustn.com"));
	}
	
	@Test
	public void testUpdatePwd() {
		
		log.info("현재비밀번호 확인: " +service.examinePwd("ccc@ccc.com", "asdf!!"));
	}
	
//	@Test
	public void testGetMemberId() {
		log.info(service.getMemberId("aaa@aaa.com"));
		
	}
	
	// 수빈
	// 회원 아이디 & 닉네임 불러오기
//	@Test
	public void testGetMemberIdName() {
		String email = "1@1";
		log.info(service.getMemberIdName(email));
	}
}
