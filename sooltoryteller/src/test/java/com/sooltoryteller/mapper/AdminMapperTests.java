package com.sooltoryteller.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sooltoryteller.domain.AdminCriteria;
import com.sooltoryteller.domain.MemberVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class AdminMapperTests {

	@Setter(onMethod_ = @Autowired)
	private AdminMapper mapper;
	
	@Test
	public void testPaging() {
		
		AdminCriteria adCri = new AdminCriteria();
		
		adCri.setPageNum(1);
		adCri.setAmount(10);
		
		List<MemberVO> list = mapper.getListWithPaging(adCri);
		
		list.forEach(member -> log.info(member.getMemberId()));
	}
}
