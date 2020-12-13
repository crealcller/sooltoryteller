package com.sooltoryteller.service;

import static org.junit.Assert.assertNotNull;

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
public class InquiryServiceTests {

	@Setter(onMethod_ = {@Autowired})
	private InquiryService service;
	
	@Test
	public void testExist() {
		log.info(service);
		assertNotNull(service);
	}
	
	@Test
	public void testRegister() {
		
		InquiryVO inq = new InquiryVO();
		
		inq.setInquiryId(5L);
		inq.setMemberId(6L);
		inq.setTitle("서비스테스트");
		inq.setCn("서비스테스트~~");
		
		service.register(inq);
		
		log.info("생성된 문의 번호: "+inq.getInquiryId());
	}
	
	@Test
	public void testGetList() {
		service.getList().forEach(inq -> log.info(inq));
	}
	
	@Test
	public void testGet() {
		log.info(service.get(3L));
		
	}
}
