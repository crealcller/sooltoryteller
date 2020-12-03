package com.sooltoryteller.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sooltoryteller.domain.MyLikeVO;
import com.sooltoryteller.domain.MyRevwVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MyPageMapperTests {

	@Setter(onMethod_ =@Autowired )
	private MyPageMapper mapper;
	
	
	public void testGetMyLike() {
		List<MyLikeVO> likes = mapper.getLikeList(1L);
		likes.forEach(like->log.info(like));
	}
	@Test
	public void testGetMyRevw() {
		List<MyRevwVO> revws = mapper.getRevwList(1L);
		revws.forEach(revw->log.info(revw));
		
	}
}
