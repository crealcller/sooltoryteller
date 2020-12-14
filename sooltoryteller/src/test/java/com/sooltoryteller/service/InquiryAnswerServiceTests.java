package com.sooltoryteller.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sooltoryteller.domain.InquiryAnswerVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class InquiryAnswerServiceTests {

	@Setter(onMethod_ = {@Autowired})
	private InquiryService inqService;
	
	@Setter(onMethod_ = {@Autowired})
	private InquiryAnswerService inqAnService;
	
	@Test
	public void testExist() {
		log.info(inqAnService);
		assertNotNull(inqAnService);
	}
	
	@Test
	public void testChecking() {
		inqAnService.checking(3L, "IP");
	}
	
	@Test
	public void testRegister() {
		InquiryAnswerVO inqAn = new InquiryAnswerVO();
		
		inqAn.setAnswerId(2L);
		inqAn.setInquiryId(2L);
		inqAn.setCn("서비스테스트 답변드려요~");
		inqAn.setAnstus("AC");
		
		String inqStus = inqService.getStus(inqAn.getInquiryId());
		String inqAnStu = inqAnService.getStus(inqAn.getInquiryId());
		
		if(inqStus != null && inqAnStu != null) {
			if(inqAnStu.equals("AW") && inqStus.equals("IP")) {
				
				inqAnService.register(inqAn, "IC");
			}
		}
		
	}
}
