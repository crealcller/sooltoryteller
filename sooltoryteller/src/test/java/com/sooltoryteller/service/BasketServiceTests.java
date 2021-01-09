package com.sooltoryteller.service;

import static org.junit.Assert.assertNotNull;

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
public class BasketServiceTests {

	@Setter(onMethod_ = {@Autowired})
	private BasketService service;
	
	@Test
	public void testExist() {
		log.info(service);
		assertNotNull(service);
	}
	
	@Test
	public void testRegister() {
		BasketVO basket = new BasketVO();
		basket.setLiqId(10L);
		basket.setMemberId(3L);
		basket.setQty(3);
		
		service.register(basket);
	}
	
	@Test
	public void testGetList() {
		service.getList(3L).forEach(basket -> log.info(basket));
	}
	
	@Test
	public void testDelete() {
		log.info(service.remove(3L, 10L));
	}
	
	@Test
	public void testUpdate() {
		BasketVO basket = new BasketVO();
		basket.setLiqId(1L);
		basket.setMemberId(3L);
		basket.setQty(5);
		
		service.modify(basket);
	}
}
