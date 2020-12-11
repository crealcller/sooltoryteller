package com.sooltoryteller.service;

import static org.hamcrest.CoreMatchers.nullValue;
import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sooltoryteller.domain.FaqVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class FaqServiceTests {

	@Setter(onMethod_ = {@Autowired})
	private FaqService service;
	
	@Test
	public void testExist() {
		log.info(service);
		assertNotNull(service);
	}
	
	@Test
	public void testRegister() {
		
		FaqVO faq = new FaqVO();
		faq.setFaqId(1L);
		faq.setTitle("서비스 테스트");
		faq.setCn("서비스 테스트");
		
		service.register(faq);
		
		log.info("생성된 게시물의 번호 : "+faq.getFaqId());
	}
	
//	@Test
//	public void testGetList() {
//		service.getList().forEach(faq -> log.info(faq));
//	}
	
	@Test
	public void testGet() {
		log.info(service.get(1L));
	}
	
	@Test
	public void testDelete() {
		log.info("REMOVE RESULT: "+service.remove(1L));
		
	}
	
	@Test
	public void testUpdate() {
		FaqVO faq = service.get(1L);
		
		if(faq == null) {
			return;
		}
		
		faq.setTitle("서비스 수정 테스트");
		log.info("MODIFY RESULT: "+service.modify(faq));
	}
}
