package com.sooltoryteller.mapper;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sooltoryteller.domain.BbstCriteria;
import com.sooltoryteller.domain.BbstMemberJoinVO;

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
		
		List<BbstMemberJoinVO> list = mapper.getBbstList(cri);
		list.forEach(bbstList -> log.info(bbstList.getBbstId()));
	}
	
	@Test
	public void testBbstSearch() {
		BbstCriteria cri = new BbstCriteria();
		cri.setKeyword("1");
		cri.setType("TC");
		
		List<BbstMemberJoinVO> list = mapper.getBbstList(cri);
		list.forEach(bbstList -> log.info(bbstList));
		log.info("TYPE: " +  cri.getType());
		log.info("KEYWORD: " + cri.getKeyword());
	}
	
	@Test
	public void testInsertBbstWithKey() {
		
		BbstMemberJoinVO bbst = new BbstMemberJoinVO();
		bbst.setMemberId(20L);
		bbst.setTitle("매퍼제목테스트");
		bbst.setCnImg("매퍼이미지테스트.jpg");
		bbst.setCn("매퍼내용테스트");
		bbst.setInqrNum(0);
		bbst.setLikesNum(0);
		bbst.setReplyNum(0);
		
		mapper.insertBbstWithKey(bbst);
		
		log.info("========== INSERT: " + bbst + " ==========");
	}
	
	@Test
	public void testGetBbst() {
		
		BbstMemberJoinVO bbst = mapper.getBbst(13L);
		log.info("========== READ: " + bbst + " ==========");
		assertNotNull(bbst);
	}
	
	@Test
	public void testDeleteBbst() {
		int count = mapper.deleteBbst(10L);
		log.info("========== DELETE COUNT: " + count + " ==========");
	}
	
	@Test
	public void testUpdateBbst() {
		
		BbstMemberJoinVO bbst = new BbstMemberJoinVO();
		bbst.setBbstId(12L);
		bbst.setTitle("매퍼테스트업뎃업뎃");
		bbst.setCnImg("매퍼테스트업뎃.jpg");
		bbst.setCn("매퍼테스트업뎃업뎃");
		
		int count = mapper.updateBbst(bbst);
		log.info("========== UPDATE COUNT: " + count + " ==========");
	}
	
}
