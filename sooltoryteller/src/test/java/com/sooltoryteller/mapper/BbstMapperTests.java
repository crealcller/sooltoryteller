package com.sooltoryteller.mapper;

import java.util.List;

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
public class BbstMapperTests {

	@Setter(onMethod_ = @Autowired)
	private BbstMapper mapper;
	
	@Test
	public void testGetBbstList() {
		BbstCriteria cri = new BbstCriteria();
		mapper.getBbstList(cri).forEach(bbstList -> log.info(bbstList));
	}
	
	@Test
	public void testPaging() {
		BbstCriteria cri = new BbstCriteria();
		cri.setPageNum(2);
		cri.setAmount(9);
		
		List<BbstJoinVO> list = mapper.getBbstList(cri);
		list.forEach(bbstList -> log.info(bbstList.getBbstId()));
	}
	
	@Test
	public void testBbstSearch() {
		BbstCriteria cri = new BbstCriteria();
		cri.setKeyword("1");
		cri.setType("TC");
		
		List<BbstJoinVO> list = mapper.getBbstList(cri);
		list.forEach(bbstList -> log.info(bbstList));
		log.info("TYPE: " +  cri.getType());
		log.info("KEYWORD: " + cri.getKeyword());
	}
	
	@Test
	public void testInsertBbstWithKey() {
		
		BbstJoinVO bbst = new BbstJoinVO();
		bbst.setMemberId(20L);
		bbst.setTitle("매퍼제목테스트");
		bbst.setCnImg("매퍼이미지테스트.jpg");
		bbst.setCnThumbimg("매퍼이미지테스트.jpg");
		bbst.setCn("매퍼내용테스트");
		
		mapper.insertBbstWithKey(bbst);
		log.info("========== INSERT BBST: " + bbst + " ==========");
		
		BbstCntVO cnt = new BbstCntVO();
		mapper.insertBbstCnt(cnt);
		log.info("========== INSERT CNT: " + cnt + " ==========");
	}
	
	@Test
	public void testGetBbst() {
		BbstJoinVO bbst = mapper.getBbst(166L);
		log.info("========== READ: " + bbst + " ==========");
	}
	
	@Test
	public void testDeleteBbst() {
		int count = mapper.deleteBbst(10L);
		log.info("========== DELETE COUNT: " + count + " ==========");
	}
	
	@Test
	public void testUpdateBbst() {
		
		BbstJoinVO bbst = new BbstJoinVO();
		bbst.setBbstId(12L);
		bbst.setTitle("매퍼테스트업뎃업뎃");
		bbst.setCnImg("매퍼테스트업뎃.jpg");
		bbst.setCn("매퍼테스트업뎃업뎃");
		
		int count = mapper.updateBbst(bbst);
		log.info("========== UPDATE COUNT: " + count + " ==========");
	}
	
	@Test
	public void testGetMyBbstList() {
		BbstCriteria cri = new BbstCriteria();
		cri.setPageNum(1);
		cri.setAmount(9);
		
		List<BbstJoinVO> list = mapper.getMyBbstList(cri, 2L);
		list.forEach(myList -> log.info(myList.getMemberId()));
	}
	
	@Test
	public void testGetBbstByView() {
		List<BbstJoinVO> list = mapper.getBbstByView();
		list.forEach(viewList -> log.info(viewList));
	}
}
