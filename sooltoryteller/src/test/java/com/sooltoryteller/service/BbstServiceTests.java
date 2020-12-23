package com.sooltoryteller.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sooltoryteller.domain.BbstCntVO;
import com.sooltoryteller.domain.BbstCriteria;
import com.sooltoryteller.domain.BbstJoinVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BbstServiceTests {

	@Setter(onMethod_ = {@Autowired})
	private BbstService service;
	
	@Test
	public void testExist() {
		log.info(service);
		assertNotNull(service);
	}
	
	@Test
	public void testRegister() {
		BbstJoinVO bbst = new BbstJoinVO();
		bbst.setMemberId(20L);
		bbst.setTitle("서비스테스트");
		bbst.setCnImg("서비스테스트.jpg");
		bbst.setCnThumbimg("test.jpg");
		bbst.setCn("서비스테스트");
		
		BbstCntVO cnt = new BbstCntVO();
		service.registerBbst(bbst, cnt);
		log.info("========== 생성된 게시글의 번호: " + bbst.getBbstId() + " ==========");
	}
	
	@Test
	public void testGetBbstList() {
		BbstCriteria cri = new BbstCriteria();
		assertNotNull(service.getBbstList(cri));
		service.getBbstList(cri).forEach(bbstList -> log.info(bbstList));
	}
	
	@Test
	public void testGetBbst() {
		Long bbstId = 168L;
		log.info(service.getBbst(bbstId));
	}
	
	@Test
	public void testDeleteBbst() {
		Long bbstId = 11L;
		assertNotNull(service.removeBbst(bbstId));
		log.info("REMOVE RESULT: " + service.removeBbst(bbstId));
	}
	
	@Test
	public void testUpdateBbst() {
		Long bbstId = 11L;
		BbstJoinVO bbst = service.getBbst(bbstId);
		
		if(bbst == null) {
			return;
		}
		
		bbst.setTitle("서비스업뎃테스트");
		log.info("========== MODIFY RESULT: " + service.modifyBbst(bbst) + " ==========");
	}
	
	@Test
	public void testGetMyBbstList() {
		Long memberId = 3L;
		BbstCriteria cri = new BbstCriteria();
		service.getMyBbstList(cri, memberId);
	}
	
	@Test
	public void testGetBbstByView() {
		service.getBbstByView();
	}
}
