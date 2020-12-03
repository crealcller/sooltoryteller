package com.sooltoryteller.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberFavDrkServiceTests {

	@Setter(onMethod_ = {@Autowired})
	private MemberFavDrkService service;
	
//	@Test
	public void testRegisterFavDrk() {
		int[] drink = {1,3};
		service.registerFavDrk(26L, drink);
		
	}
	
	@Test
	public void testgetFavDrk() {
		
	}
}
