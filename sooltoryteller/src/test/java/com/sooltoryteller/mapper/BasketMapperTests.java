package com.sooltoryteller.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sooltoryteller.domain.BasketVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BasketMapperTests {

	@Setter(onMethod_ = @Autowired)
	private BasketMapper mapper;
	
	@Test
	public void testGetList() {
		mapper.getList(3L).forEach(basket -> log.info(basket));
	}
	
	@Test
	public void testInsert() {
		BasketVO basket = new BasketVO();
		basket.setLiqId(5L);
		basket.setMemberId(5L);
		basket.setQty(2);
		
		mapper.insert(basket);
		
		log.info(basket);
		
	}
	
	@Test
	public void testDelete() {
		log.info("DELETE COUNT : "+mapper.delete(3L, 2L));
	}
	
	@Test
	public void testUpdate() {
		
		BasketVO basket = new BasketVO();
		
		basket.setLiqId(1L);
		basket.setMemberId(3L);
		basket.setQty(1);
		
		int count = mapper.update(basket);
		log.info("UPDATE COUNT : "+count);
	}
}
