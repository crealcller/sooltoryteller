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
		member.setEmail("try@try.com");
		member.setName("try");
		member.setPwd("7356");
		member.setTelno("01099999999");
		
		System.out.println("insert:"+mapper.insert(member));
		
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
		member.setThumbImg("a11.jpg");
		
		mapper.updateInfo(member);
		mapper.insertHist(mapper.read(member.getEmail()));
		
		log.info(member);
	}
	
//	@Test
	public void testStusUpdate() {
		
		mapper.updateRegstus("iiii@iiii.com");
		
	}
	
//	@Test
	public void testGetRegStus() {
		log.info(mapper.getRegStus("aaa@aaa.com"));
		
	}
	
//	@Test
	public void testGetEmail() {
		log.info(mapper.checkEmail("aaa@aaa.com"));
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
	
	// 수빈
	// 회원 아이디 & 닉네임 불러오기
//	@Test
	public void testGetMemberIdName() {
		String email = "1@1";
		log.info(mapper.getMemberIdName(email));
	}
	
}
