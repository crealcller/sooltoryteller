package com.sooltoryteller.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sooltoryteller.domain.Criteria;
import com.sooltoryteller.domain.MyLikeVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class LiqLikeMapperTests {

	@Setter(onMethod_ =@Autowired )
	private LiqLikeMapper mapper;
	
	
	@Test
	public void testGetCountByMemberId() {
		log.info("result"+mapper.getCountMemberId(1L));
	}
	
	public void testGetMyListWithPaging() {
		Criteria cri = new Criteria(1,5);
		List<MyLikeVO> likes = mapper.getMyListWithPaging(1L, cri);
		likes.forEach(like -> log.info(like));
	}
	
	public void testGetCount() {
		int result= mapper.getCount(7L, 1L);
		log.info("result:" + (result==1));
	}
	
	public void testInsert() {
		int count = mapper.insert(6L, 1L);
		log.info("result:" + (count == 1));
	}
}
