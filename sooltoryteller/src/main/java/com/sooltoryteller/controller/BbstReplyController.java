package com.sooltoryteller.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.sooltoryteller.domain.BbstReplyCriteria;
import com.sooltoryteller.domain.BbstReplyJoinVO;
import com.sooltoryteller.domain.BbstReplyPageDTO;
import com.sooltoryteller.domain.MyBbstReplyPageDTO;
import com.sooltoryteller.service.BbstReplyService;
import com.sooltoryteller.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/replies/")
@RestController
@Log4j
@AllArgsConstructor
public class BbstReplyController {

	private BbstReplyService service;
	
	// 댓글 등록
	@PostMapping(value = "/new",
		consumes = "application/json",
		produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> createBbstReply(
		HttpSession session, BbstReplyJoinVO bbstReply, 
		@RequestBody BbstReplyJoinVO vo) {
		
		log.info("========== BBST REPLY MEMBER JOIN VO: " + vo + " ==========");
		
		int insertCount = service.registerBbstReply(vo);
		log.info("========== REPLY INSERT COUNT: " + insertCount + " ==========");
		
		return insertCount == 1
			? new ResponseEntity<>("success", HttpStatus.OK)
			: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 댓글 조회
	@GetMapping(value = "/{bbstReplyId}",
		produces = {
			MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<BbstReplyJoinVO> getBbstReply(
		@PathVariable("bbstReplyId") Long bbstReplyId) {
		
		log.info("========== GET: " + bbstReplyId + " ==========");
		
		return new ResponseEntity<> (service.getBbstReply(bbstReplyId), HttpStatus.OK);
		}
	
	// 댓글 수정
	@RequestMapping(method = { RequestMethod.PUT, RequestMethod.PATCH },
		value = "/{bbstReplyId}",
		consumes = "application/json",
		produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> modifyBbstReply(
		@RequestBody BbstReplyJoinVO vo, 
		@PathVariable("bbstReplyId") Long bbstReplyId) {
		
		vo.setBbstReplyId(bbstReplyId);
		log.info("========== BBST REPLY ID : " + bbstReplyId + " ==========");
		log.info("========== MODIFY: " + vo + " ==========");
		
		return service.modifyBbstReply(vo) == 1
			? new ResponseEntity<> ("success", HttpStatus.OK)
			: new ResponseEntity<> (HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 댓글 삭제
	@DeleteMapping(value = "/{bbstReplyId}",
		produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> removeBbstReply(
		HttpSession session, BbstReplyJoinVO bbstReply,
		@PathVariable("bbstReplyId") Long bbstReplyId
		) {
		
		log.info("========== REMOVE : " + bbstReplyId + " ==========");
		
		return service.removeBbstReply(bbstReplyId) == 1
			? new ResponseEntity<> ("success", HttpStatus.OK)
			: new ResponseEntity<> (HttpStatus.INTERNAL_SERVER_ERROR);
	}
		
	// 게시글의 모든 댓글 조회
	@GetMapping(value = "/pages/{bbstId}/{page}",
		produces = { 
			MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<BbstReplyPageDTO> getBbstReplyList(
		@PathVariable("page") int page,
		@PathVariable("bbstId") Long bbstId) {
		
		log.info("========== GET BBST REPLY LIST ==========");
		
		BbstReplyCriteria cri = new BbstReplyCriteria(page, 5);
		log.info("========== GET BBST REPLY LIST BBSTID: " + bbstId + " ==========");
		log.info("========== CRI: " + cri + " ==========");
		
		return new ResponseEntity<>(service.getBbstReplyListPage(cri, bbstId), HttpStatus.OK);
	}
	
	// 마이페이지
	// 내가 쓴 댓글 리스트
	@GetMapping(value = "/mypages/{memberId}/{page}",
		produces = {
			MediaType.APPLICATION_ATOM_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<MyBbstReplyPageDTO> getMyBbstReply(
		@PathVariable("page") int page,
		@PathVariable("memberId") Long memberId) {
		
		log.info("========== MEMBERID " + memberId + "'S BBST REPLY LIST ==========");
		
		BbstReplyCriteria cri = new BbstReplyCriteria(page, 5);
		log.info("========== " + cri + " ==========");
		
		return new ResponseEntity<>(service.getMyBbstReply(cri, memberId), HttpStatus.OK);
	}
}
