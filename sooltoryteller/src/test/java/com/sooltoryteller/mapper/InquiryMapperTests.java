package com.sooltoryteller.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sooltoryteller.domain.InquiryVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class InquiryMapperTests {

	@Setter(onMethod_ = @Autowired)
	private InquiryMapper mapper;
	
	@Test
	public void testGetList() {
		mapper.getList().forEach(inq -> log.info(inq));
		
	}
	
	@Test
	public void testInsert() {
		InquiryVO inq = new InquiryVO();
		inq.setInquiryId(4L);
		inq.setName("임현수");
		inq.setTitle("인서트테스트1!!");
		inq.setCn("인서트 테스트임당");
		
		mapper.insert(inq);
		
		log.info(inq);
		
	}

	@Test
	public void testRead() {
		
		log.info(mapper.read(3L));
		
	}

	@Test
	public void testUpdate() {
		
		log.info(mapper.update(1L, "IP"));
	}
}
