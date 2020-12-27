package com.sooltoryteller.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sooltoryteller.domain.AdminCriteria;
import com.sooltoryteller.domain.LiqCnVO;
import com.sooltoryteller.domain.LiqCntVO;
import com.sooltoryteller.domain.LiqCoVO;
import com.sooltoryteller.domain.LiqVO;
import com.sooltoryteller.domain.MemberVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class AdminMapperTests {

	@Setter(onMethod_ = @Autowired)
	private AdminMapper mapper;
	
	@Test
	public void testPaging() {
		
		AdminCriteria adCri = new AdminCriteria();
		
		adCri.setPageNum(1);
		adCri.setAmount(10);
		
		List<MemberVO> list = mapper.getListWithPaging(adCri);
		
		list.forEach(member -> log.info(member.getMemberId()));
	}
	
	public void testGetLiqExist() {
		
		log.info("result : "+mapper.getliqExist("술취한 원숭이"));
	}
	
	public void testInsert() {
		LiqVO liq = new LiqVO();
		liq.setNm("123");
		liq.setCapct(133);
		liq.setCate("탁주");
		liq.setIrdnt("asdfa");
		liq.setLv(1);
		liq.setLiqCoId(1L);
		mapper.insertLiq(liq, 1L);
		LiqCntVO cnt = new LiqCntVO();
		mapper.insertLiqCnt(cnt);
	}
	
	public void testUpdate() {
		LiqVO liq = new LiqVO();
		liq.setLiqId(42L);
		liq.setCate("asdf");
		liq.setCapct(100);
		liq.setLv(2);
		liq.setNm("asdf");
		liq.setLiqCoId(1L);
		liq.setArds("asdfasdfasd");
		liq.setIrdnt("asdad");
		LiqCnVO cn = new LiqCnVO();
		cn.setLiqId(42L);
		cn.setIntro("12341asdfdsaf");
		
		mapper.updateLiq(liq);
		mapper.updateCn(cn);
	}
	public void testGetListWithPaging() {
		AdminCriteria cri = new AdminCriteria();
		List<LiqVO> liqList = mapper.getLiqListWithPaging(cri);
		liqList.forEach(liq->log.info(liq));
	}
	
	
	public void testGetLiqCo() {
		log.info(mapper.getLiqCoById(1L));
	}
	@Test
	public void testGetLiqCoList() {
		AdminCriteria adCri = new AdminCriteria(1,5);
		List<LiqCoVO> list = mapper.getLiqCoListWithPaging(adCri);
		list.forEach(co -> log.info(co));
	}

	public void testLiqCoCnt() {
		boolean result = mapper.getLiqCoId("명세주가") != null;
		log.info("result : " + result);
	}
	
}
