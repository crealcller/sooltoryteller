package com.sooltoryteller.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sooltoryteller.domain.Criteria;
import com.sooltoryteller.domain.LiqRevwVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class LiqRevwMapperTests {

	@Setter(onMethod_ =@Autowired )
	private LiqRevwMapper mapper;
	
	
	public void testGetListWithPaging() {
		Criteria cri = new Criteria(2,5);
		List<LiqRevwVO> revws = mapper.getListWithPaging(1L, cri);
		revws.forEach(revw -> log.info(revw));
	}
	
	public void testUpdate() {
		LiqRevwVO vo = new LiqRevwVO();
		vo.setRevwId(2L);
		vo.setCn("매실 수정");
		vo.setRate(4);
		int result = mapper.update(vo);
		log.info(result);
		
	}
	public void testDelete() {
		int result = mapper.delete(23L);
		log.info(result);
	}
	
	@Test
	public void testRead() {
		LiqRevwVO vo = mapper.read(1L);
		log.info(vo);
	}
	
	public void testInsert() {
		LiqRevwVO vo = new LiqRevwVO();
		vo.setLiqId(1L);
		vo.setMemberId(1L);
		vo.setCn("doyouknow nono");
		vo.setRate(2);
		log.info(vo);
		mapper.insert(vo);
		
	}
}	
