package com.sooltoryteller.mapper;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sooltoryteller.domain.OrdDtlVO;

import lombok.Setter;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class OrderMapperTests {

	@Setter(onMethod_ = @Autowired)
	private OrderMapper mapper;


	@Test
	public void testInsertOrdDtl() {
		List<OrdDtlVO> list = new ArrayList<>();
		OrdDtlVO dtl1 = new OrdDtlVO();
		dtl1.setLiqId(1L);
		dtl1.setPrc(1);
		dtl1.setQty(1);
		list.add(dtl1);
		OrdDtlVO dtl2 = new OrdDtlVO();
		dtl2.setLiqId(2L);
		dtl2.setPrc(2);
		dtl2.setQty(2);
		list.add(dtl2);
		
		mapper.insertOrdDtl(list);
	}
	
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
