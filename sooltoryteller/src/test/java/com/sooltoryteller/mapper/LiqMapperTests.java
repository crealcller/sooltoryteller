package com.sooltoryteller.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sooltoryteller.domain.BbstCriteria;
import com.sooltoryteller.domain.LiqVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class LiqMapperTests {

	@Setter(onMethod_ = @Autowired)
	private LiqMapper mapper;

	@Test
	public void getCnt() {
		log.info(mapper.getLiqCntByCate(""));
	}

	public void getList() {
		BbstCriteria cri = new BbstCriteria();
		List<LiqVO> list = mapper.getLiqListByCate("", cri);
		list.forEach(liq -> log.info(liq));

	}

	public void testUpdateRevwCnt() {
		mapper.updateRevwCnt(11L, -1);
	}

	public void testGetOtherLiq() {
		List<LiqVO> list = mapper.getOtherLiq(3L);
		list.forEach(liq -> log.info(liq));
	}

	public void testGetAllByCateCount() {
		int listCnt = mapper.getLiqCntByCate("탁주");
		log.info(listCnt);
	}

	public void testGetAllByCate() {
		BbstCriteria cri = new BbstCriteria(1, 12);
		List<LiqVO> liqList = mapper.getLiqListByCate("탁주", cri);
		liqList.forEach(liq -> log.info(liq));
	}

	public void testGetLiq() {
		LiqVO liq = mapper.get(1L);
		log.info(liq);
	}
}
