package com.sooltoryteller.service;

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
public class MyPageServiceTests {

	@Setter(onMethod_ = @Autowired)
	private MyPageService service;
	
	@Test
	public void testGetMyLike() {
		List<MyLikeVO> likes = service.getLikeList(1L);
		likes.forEach(like->log.info(like));
	}
	
	public void testGetMyRevw() {
		List<MyRevwVO> revws = service.getRevwList(1L);
		revws.forEach(revw->log.info(revw));
	}
}
