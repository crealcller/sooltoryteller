package com.sooltoryteller.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Commit;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.transaction.annotation.Transactional;

import com.sooltoryteller.domain.InquiryAnswerVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class InquiryAnswerMapperTests {

	@Setter(onMethod_ = @Autowired)
	private InquiryAnswerMapper inqAnMapper;
	@Setter(onMethod_ = @Autowired)
	private InquiryMapper inqMapper;
	
	@Transactional
	@Commit
	@Test
	public void testInsert() {
		//문의 조회->상태변경:답변대기(AW)
		inqAnMapper.insert(2L);
		//문의 테이블의 상태변경 : 문의진행(IP)
		inqMapper.update(2L, "IP");
	}
	
	@Test
	public void testRead() {
		
		log.info(inqAnMapper.read(1L));
		
	}

	@Transactional
	@Rollback(false)
	@Test
	public void testUpdate() {
		InquiryAnswerVO inqAn = new InquiryAnswerVO();
		inqAn.setInquiryId(1L);
		inqAn.setAnstus("AC");
		inqAn.setCn("답변드려욤~");
		inqAnMapper.update(inqAn);
		inqMapper.update(inqAn.getInquiryId(), "IC");
	}
}
