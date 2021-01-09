package com.sooltoryteller.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sooltoryteller.domain.OrderJoinVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class OrderServiceTests {

	@Setter(onMethod_ = {@Autowired})
	private OrderService order;
	
//	@Test
//	public void testGetOneLiqInfo() {
//		OrderJoinVO vo = new OrderJoinVO();
//		Long liqId = 1L;
//		log.info(order.getOneLiqInfo(liqId));
//	}
}
