package com.sooltoryteller.service;

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

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class AdminServiceTests {

	@Setter(onMethod_ = {@Autowired})
	private AdminService service;
	
	@Test
	public void testUpdateLiq() {
		LiqVO liq = new LiqVO();
		liq.setCate("탁주");
		liq.setArds("sszxzx");
		liq.setCapct(100);
		liq.setLv(13);
		liq.setLiqImg("asdfasdf");
		liq.setLiqThumb("asas");
		liq.setIrdnt("adsf");
		liq.setLiqId(91L);
		LiqCnVO cn = new LiqCnVO();
		cn.setIntro("asdf");
		liq.setLiqCn(cn);
		service.modifyLiq(liq);
	}
	
	public void testRemoveLiqCo() {
		log.info("remove liq co");
		service.removeLiqCo(69L);
	}
	
	public void testModifyLiqCo() {
		log.info("modify liq co");
		LiqCoVO co = new LiqCoVO();
		co.setLiqCoId(68L);
		co.setNm("tnwjdtnwjd");
		co.setAddr("ss");
		co.setTelno("222");
		service.modifyLiqCo(co);
	}
	
	public void getList() {
		service.getList(new AdminCriteria(2,10)).forEach(member -> log.info(member));
	}
	
	
	public void testRegister() {
		LiqVO liq = new LiqVO();
		liq.setNm("123");
		liq.setCapct(133);
		liq.setCate("탁주");
		liq.setIrdnt("asdfa");
		liq.setLiqImg("sdsds");
		liq.setLiqThumb("sddsds");
		liq.setLv(1);
		LiqCnVO liqCn = new LiqCnVO();
		liqCn.setIntro("sdsdsds");
		liq.setLiqCn(liqCn);
		LiqCntVO cnt = new LiqCntVO();
		liq.setLiqCnt(cnt);
		service.registerLiq(liq, 1L); 
	}
	
	public void testGetAll() {
		AdminCriteria adCri = new AdminCriteria();
		List<LiqVO> allLiq = service.getLiqListWithPaging(adCri);
		allLiq.forEach(liq->log.info(liq));
	}
	
}
