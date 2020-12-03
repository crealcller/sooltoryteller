package com.sooltoryteller.mapper;

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
public class MemberMapperTests {

	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	
//	@Test
	public void testGetList() {
		mapper.getList().forEach(member -> log.info(member));
	}
	
//	@Test
	public void testInsert() {
		MemberVO member = new MemberVO();
		member.setEmail("iiii@iiii.com");
		member.setName("iiii");
		member.setPwd("4444");
		member.setTelno("01099999999");
		
		mapper.insert(member);
		
		mapper.insertHist(mapper.read(member.getEmail()));
		log.info(member);
	}
	
//	@Test
	public void testRead() {
		MemberVO member = mapper.read("aaa@aaa.com");
		
		log.info(member);
	}
	
//	@Test
	public void testUpdate() {
		
		MemberVO member = new MemberVO();
		
		member.setEmail("bbb@bbb.com");
		
		
		member.setName("test4");
		member.setTelno("01098769876");
		member.setImg("a11.jpg");
		
		mapper.updateInfo(member);
		mapper.insertHist(mapper.read(member.getEmail()));
		
		log.info(member);
	}
	
//	@Test
	public void testStusUpdate() {
		
		mapper.updateRegstus("iiii@iiii.com");
		
	}
	
//	@Test
	public void testGetLoginInfo() {
		log.info(mapper.getLoginInfo("aaa@aaa.com", "1111"));
		
	}
	
//	@Test
	public void testGetEmail() {
		log.info(mapper.getEmail("aaa@aaa.com"));
	}
	
//	@Test
	public void testGetPwd() {
		log.info(mapper.getPwd("aaa@aaa.com"));
	}
	
//	@Test
	public void testUpdatePwd() {
		String email = "gustn@gustn.com";
		mapper.updatePwd(email, "0000");
		mapper.insertHist(mapper.read(email));
	}
	
//	@Test
	public void testGetId() {
		log.info(mapper.getMemberId("aaa@aaa.com"));
		
	}
}
