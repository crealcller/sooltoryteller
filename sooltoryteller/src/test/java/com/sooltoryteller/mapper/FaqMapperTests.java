package com.sooltoryteller.mapper;

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
public class FaqMapperTests {

	@Setter(onMethod_ = @Autowired)
	private FaqMapper mapper;
	
	@Test
	public void testInsert() {
		FaqVO faq = new FaqVO();
		faq.setFaqId(1L);
		faq.setTitle("테스트제목");
		faq.setCn("테스트 내용");
		
		mapper.insert(faq);
		
		log.info(faq);
	}
	
	@Test
	public void testGetList() {
		log.info(mapper.getList());
	}
	
	@Test
	public void testRead() {
		log.info(mapper.read(1L));
	}
	
	@Test
	public void testUpdate() {
		FaqVO faq = new FaqVO();
		
		faq.setFaqId(1L);
		faq.setTitle("수정된 제목");
		faq.setCn("수정된 내용");
		
		int count = mapper.update(faq);
		
		log.info("UPDATE COUNT : "+count);
	}
	
	@Test
	public void testDelete() {
		log.info(mapper.delete(1L));
	}
}
