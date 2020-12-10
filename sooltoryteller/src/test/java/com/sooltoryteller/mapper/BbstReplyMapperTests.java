package com.sooltoryteller.mapper;

import java.util.List;
import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.sooltoryteller.domain.BbstReplyCriteria;
import com.sooltoryteller.domain.BbstReplyMemberJoinVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BbstReplyMapperTests {

	// 테스트 전, 해당 번호의 게시글이 존재하는지 확인
	private Long[] bbstIdArr = {163L, 164L, 165L, 166L, 168L};
	
	@Setter(onMethod_ = @Autowired)
	private BbstReplyMapper mapper;
	
	@Test
	public void testBbstReplyMapper() {
		log.info(mapper);
	}
	
	@Test
	public void testInsertBbstReply() {
		IntStream.rangeClosed(1, 10).forEach(i -> {
			
			BbstReplyMemberJoinVO vo = new BbstReplyMemberJoinVO();
			
			// 게시글 번호
			vo.setBbstId(bbstIdArr[i % 5]);
			vo.setMemberId(3L);
			vo.setReplyCn("테스트");
			
			mapper.insertBbstReply(vo);
		});
	}
	
	@Test
	public void testReadBbstReply() {
		Long targetBbstReplyId = 114L;
		BbstReplyMemberJoinVO vo = mapper.readBbstReply(targetBbstReplyId);
		log.info("========== TARGET BBST REPLY " + vo + " ==========");
	}
	
	@Test
	public void testDeleteBbstReply() {
		Long targetBbstReplyId = 2L;
		int count = mapper.deleteBbstReply(targetBbstReplyId);
		log.info("========== DELETE COUNT: " + count + " ==========");
	}
	
	@Test
	public void testUpdateBbstReply() {
		Long targetBbstReplyId = 3L;
		BbstReplyMemberJoinVO vo = mapper.readBbstReply(targetBbstReplyId);
		vo.setReplyCn("업데이트2");
		
		int count = mapper.updateBbstReply(vo);
		log.info("========== UPDATE COUNT : " + count + " ==========");
		log.info("========== UPDATE VO " + vo + " ==========");
	}
	
	@Test
	public void testGetBbstReplyList() {
		BbstReplyCriteria cri = new BbstReplyCriteria(2, 10);
		List<BbstReplyMemberJoinVO> bbstReplyList = mapper.getBbstReplyList(cri, 168L);
		bbstReplyList.forEach(reply -> log.info(reply));
	}
}
