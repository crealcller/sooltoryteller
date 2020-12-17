package com.sooltoryteller.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sooltoryteller.domain.AdminCriteria;
import com.sooltoryteller.domain.LiqCoVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class LiqCoMapperTests {

	@Setter(onMethod_ = @Autowired)
	private LiqCoMapper mapper;

	
	public void testGetLiqCo() {
		log.info(mapper.getLiqCoById(1L));
	}
	@Test
	public void testGetLiqCoList() {
		AdminCriteria adCri = new AdminCriteria(1,5);
		List<LiqCoVO> list = mapper.getLiqCoListWithPaging(adCri);
		list.forEach(co -> log.info(co));
	}

	public void testLiqCoCnt() {
		boolean result = mapper.getLiqCoId("명세주가") != null;
		log.info("result : " + result);
	}
	
}
