package com.sooltoryteller.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sooltoryteller.domain.OrdRequestDTO;
import com.sooltoryteller.domain.PayHistVO;
import com.sooltoryteller.domain.PayVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class PayServiceTests {

	@Setter(onMethod_ = {@Autowired})
	private PayService service;
	
	@Test
	public void testRegister() {
		OrdRequestDTO dto = new OrdRequestDTO();
		PayVO pay = new PayVO();
		pay.setMemberId(1L);
		pay.setOrdPrc(2000);
		pay.setOrdId(1L);
		dto.setPay(pay);
		pay.setPayMthd("카카오");
		PayHistVO hist = new PayHistVO();
		hist.setAfStus("P");
		hist.setBfStus("P");
		dto.setPayHist(hist);
		
		service.register(dto);
	}
	
}
