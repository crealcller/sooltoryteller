package com.sooltoryteller.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sooltoryteller.domain.LiqVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class LiqMapperTests {

	@Setter(onMethod_ =@Autowired )
	private LiqMapper mapper;
	
	@Test
	public void testGetAllByKind(){
		List<LiqVO> liqList = mapper.getAllByKind("탁주");
		liqList.forEach(liq->log.info(liq));
	}
	
	
	
	public void testGetAll() {
		List<LiqVO> liqList = mapper.getAll();
		liqList.forEach(liq->log.info(liq));
	}
	
	
	public void testGetLiq() {
		LiqVO liq = mapper.get(1L);
		log.info(liq);
	}
}
