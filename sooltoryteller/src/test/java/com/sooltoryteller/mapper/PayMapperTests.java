package com.sooltoryteller.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sooltoryteller.domain.PayHistVO;
import com.sooltoryteller.domain.PayVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class PayMapperTests {

	@Setter(onMethod_ = @Autowired)
	private PayMapper mapper;
	
	@Test
	public void testInsertPayHist() {
		PayHistVO hist = new PayHistVO();
		hist.setAfStus("P");
		hist.setBfStus("P");
		mapper.insertPayHist(hist);
		
	}
	
	public void testInsertPay() {
		PayVO pay = new PayVO();
		pay.setMemberId(3L);
		pay.setOrdId(1L);
		pay.setOrdPrc(2000);
		pay.setPayMthd("카카오");
		log.info("insert result : " +mapper.insert(pay));
		
	}


}
