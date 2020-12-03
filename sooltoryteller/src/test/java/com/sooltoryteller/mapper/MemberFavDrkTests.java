package com.sooltoryteller.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sooltoryteller.domain.MemberFavDrkVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberFavDrkTests {

	@Setter(onMethod_ = @Autowired)
	private MemberFavDrkMapper mapper;
	
//	@Test
	public void testInsert() {
		
		MemberFavDrkVO memberFavDrk = new MemberFavDrkVO();
		
		int[] drink = {1,7};
		memberFavDrk.setMemberId(11L);
		
		for(int i =0; i<2; i++) {
			memberFavDrk.setDrkCdId(drink[i]);
		
			mapper.insert(memberFavDrk);
		
	}
		System.out.println(memberFavDrk);
	}
	
//	@Test
	public void testGet() {
		
		List<Integer> list = mapper.get(11L);
		list.forEach(drink -> log.info(drink));
	}
	
//	@Test
	public void testGetFavDrkId() {
		List<Long> list = mapper.getFavDrkId(11L);
		list.forEach(drkId -> log.info(drkId));
	}
	
//	@Test
	public void testUpdateFavDrk() {
		MemberFavDrkVO memberFavDrk = new MemberFavDrkVO();
		List<Long> list = mapper.getFavDrkId(11L);
		int[] drink = {5,6};
		for(int i=0; i<list.size(); i++) {
			memberFavDrk.setDrkCdId(drink[i]);
			memberFavDrk.setFavDrkId(list.get(i));
			mapper.updateFavDrk(memberFavDrk);
		}
	}
}