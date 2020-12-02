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
	
	@Test
	public void testExist() {
		
		log.info(service);
		assertNotNull(service);
	}
	
//	@Test
	public void testJoin() {
		
		MemberVO member = new MemberVO();
		member.setEmail("gustn@gustn.com");
		member.setName("gustn");
		member.setPwd("0720");
		member.setTelno("01063517402");
		
		service.join(member);
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
	
//	@Test
	public void testLogin() {
		System.out.println(service.loginCheck("aaa@aaa.com", "1111"));
		
	}
	
//	@Test
	public void testCheckEmail() {
		log.info(service.checkEmail("aaa@aaa.com"));
	}
	
//	@Test
	public void testGetPwd() {
		System.out.println(service.getPwd("gustn@gustn.com"));
	}
	
//	@Test
	public void testUpdatePwd() {
		log.info(service.modifyPwd("gustn@gustn.com", "7777"));
	}
	
	@Test
	public void testGetMemberId() {
		log.info(service.getMemberId("aaa@aaa.com"));
		
	}
}
