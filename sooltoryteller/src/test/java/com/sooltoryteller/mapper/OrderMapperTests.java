package com.sooltoryteller.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sooltoryteller.domain.OrdVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class OrderMapperTests {

	@Setter(onMethod_ = @Autowired)
	private OrderMapper mapper;

//	@Test
//	public void testInsertOrd() {
//		OrdVO ord = new OrdVO();
//		ord.setMemberId(101L);
//		ord.setTtlQty(3);
//		ord.setTtlPrc(3 * 10000);
//		ord.getOrdStus();
//		ord.getDlvyFee();
//		ord.setRecipient("김둥");
//		ord.setTelno("01010101010");
//		ord.setOrdAdr("서울시 둥이구 둥이로 둥이아파트");
//		mapper.insertOrd();
//	}
}
