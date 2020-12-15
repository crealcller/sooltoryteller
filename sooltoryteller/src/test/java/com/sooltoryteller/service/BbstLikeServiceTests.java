package com.sooltoryteller.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BbstLikeServiceTests {

	@Setter(onMethod_ = {@Autowired})
	private BbstLikeService service;

	// 좋아요
	@Test
	public void testLikeBbst() {
		log.info("========== LIKE BBST ==========");
		service.likeBbst(168L, 8L);
	}

	// 좋아요 취소
	@Test
	public void testCancelLikeBbst() {
		log.info("========== CANCEL LIKE BBST ==========");
		service.cancelLikeBbst(168L, 8L);
	}

	// 좋아요 상태
	@Test
	public void testBbstLikeStus() {
		log.info("========== BBST LIKE STATUS ==========");
		service.bbstLikeStus(168L, 8L);
	}

	// 게시글 좋아요수
	@Test
	public void testBbstLikeCnt() {
		int count = service.bbstLikeCnt(168L);
		log.info("========== BBST LIKE COUNT: " + count + " ==========");
	}

	// 마이페이지
	// 내가 좋아요 누른 게시글 리스트
}
