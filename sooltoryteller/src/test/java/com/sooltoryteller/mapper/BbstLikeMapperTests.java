package com.sooltoryteller.mapper;

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
public class BbstLikeMapperTests {

	@Setter(onMethod_ = @Autowired)
	private BbstLikeMapper mapper;
	
	// 좋아요
	@Test
	public void testLikeBbst() {
		int result = mapper.likeBbst(168L, 2L);
		log.info("========== LIKE BBST RESULT: " + (result == 1) + " ==========");
	}
	
	// 좋아요 취소
	@Test
	public void testCancelLikeBbst() {
		int result = mapper.cancelLikeBbst(168L, 4L);
		log.info("========== CANCEL LIKE BBST RESULT: " + (result == 1) + " ==========");
	}
	
	// 좋아요 상태
	@Test
	public void testBbstLikeStus() {
		mapper.bbstLikeStus(168L, 3L);
	}
	
	// 게시글 좋아요수 업데이트
	@Test
	public void testUpdateBbstLikeCnt() {
		mapper.updateLikeCnt(168L, 1);
	}
	
	// 게시글 좋아요수
	@Test
	public void testBbstLikeCnt() {
		int count = mapper.getBbstLikeCnt(168L);
		log.info("========== BBST LIKE COUNT: " + count + " ==========");
	}
	
	
	// 마이페이지
	// 내가 좋아요 누른 게시글 리스트
}
