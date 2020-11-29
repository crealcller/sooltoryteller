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
		member.setMemberSeq(8);
		member.setMemberEmail("iiii@iiii.com");
		member.setMemberName("iiii");
		member.setMemberPwd("4444");
		member.setMemberTelno("01099999999");
		
		mapper.insert(member);
		mapper.insertHist(member);
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
		
		member.setMemberEmail("ggg@ggg.com");
		
		MemberVO result = mapper.read(member.getMemberEmail());
		
		result.setMemberSeq(12);
//		result.setMemberName("test4");
//		result.setMemberTelno("01098769876");
		result.setMemberImg("abc.jpg");
		
		mapper.updateInfo(result);
		mapper.insertHist(result);
		
		log.info(result);
		log.info(member);
	}
	
	@Test
	public void testStusUpdate() {
		MemberVO member = new MemberVO();
		
		member.setMemberEmail("fff@fff.com");
		
		mapper.updateRegstus(member.getMemberEmail());
		
		log.info(member);
	}
	
}
