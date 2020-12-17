package com.sooltoryteller.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sooltoryteller.domain.LiqCnVO;
import com.sooltoryteller.domain.LiqCntVO;
import com.sooltoryteller.domain.LiqVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class LiqMapperTests {

	@Setter(onMethod_ =@Autowired )
	private LiqMapper mapper;
	
	
	@Test
	public void testInsert() {
		LiqVO liq = new LiqVO();
		liq.setNm("123");
		liq.setCapct(133);
		liq.setCate("탁주");
		liq.setImg("1234123");
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
		liq.setImg("asdf");
		liq.setLv(2);
		liq.setNm("asdf");
		liq.setLiqCoId(1L);
		liq.setArds("asdfasdfasd");
		liq.setIrdnt("asdad");
		LiqCnVO cn = new LiqCnVO();
		cn.setLiqId(42L);
		cn.setIntro("12341asdfdsaf");
		
		mapper.update(liq);
		mapper.updateCn(cn);
	}
	
	public void testGetAllByKindCount() {
		int listCnt = mapper.getCountLiqListByKind("탁주");
		log.info(listCnt);
	}
	
	public void testGetAllCount() {
		int allCnt = mapper.getCountLiqList();
		log.info(allCnt);
	}
	
	public void testGetAllByKind(){
		List<LiqVO> liqList = mapper.getLiqListByKind("탁주");
		liqList.forEach(liq->log.info(liq));
	}
	
	public void testGetAll() {
		List<LiqVO> liqList = mapper.getLiqList();
		liqList.forEach(liq->log.info(liq));
	}
	
	public void testGetLiq() {
		LiqVO liq = mapper.get(1L);
		log.info(liq);
	}
}
