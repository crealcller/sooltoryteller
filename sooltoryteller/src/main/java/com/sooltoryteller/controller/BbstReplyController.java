package com.sooltoryteller.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.sooltoryteller.domain.BbstReplyCriteria;
import com.sooltoryteller.domain.BbstReplyMemberJoinVO;
import com.sooltoryteller.domain.BbstReplyPageDTO;
import com.sooltoryteller.service.BbstReplyService;
import com.sooltoryteller.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/cheers/get/replies/")
@RestController
@Log4j
@AllArgsConstructor
public class BbstReplyController {

	private BbstReplyService service;
	private MemberService mservice;
	
	// 댓글 등록
	@PostMapping(value = "/new",
		consumes = "application/json",
		produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> createBbstReply(HttpSession session, BbstReplyMemberJoinVO bbstReply,
		@RequestBody BbstReplyMemberJoinVO vo) {
		
		String email = (String)session.getAttribute("email");
		bbstReply.setMemberId(mservice.getMemberIdName(email).getMemberId());
		bbstReply.setName(mservice.getMemberIdName(email).getName());
		
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
	public ResponseEntity<BbstReplyMemberJoinVO> getBbstReply(HttpSession session, BbstReplyMemberJoinVO bbstReply,
		@PathVariable("bbstReplyId") Long bbstReplyId) {
		
		String email = (String)session.getAttribute("email");
		bbstReply.setMemberId(mservice.getMemberIdName(email).getMemberId());
		bbstReply.setName(mservice.getMemberIdName(email).getName());
		
		log.info("========== GET: " + bbstReplyId + " ==========");
		
		return new ResponseEntity<> (service.getBbstReply(bbstReplyId), HttpStatus.OK);
		}
	
	// 댓글 수정
	@RequestMapping(method = { RequestMethod.PUT, RequestMethod.PATCH },
		value = "/{bbstReplyId}",
		consumes = "application/json",
		produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> modifyBbstReply(HttpSession session, BbstReplyMemberJoinVO bbstReply,
		@RequestBody BbstReplyMemberJoinVO vo,
		@PathVariable("bbstReplyId") Long bbstReplyId) {
		
		String email = (String)session.getAttribute("email");
		bbstReply.setMemberId(mservice.getMemberIdName(email).getMemberId());
		bbstReply.setName(mservice.getMemberIdName(email).getName());
		
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
	public ResponseEntity<String> removeBbstReply(HttpSession session, BbstReplyMemberJoinVO bbstReply,
		@PathVariable("bbstReplyId") Long bbstReplyId) {
		
		String email = (String)session.getAttribute("email");
		bbstReply.setMemberId(mservice.getMemberIdName(email).getMemberId());
		bbstReply.setName(mservice.getMemberIdName(email).getName());
		
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
		HttpSession session, BbstReplyMemberJoinVO bbstReply,
		@PathVariable("page") int page,
		@PathVariable("bbstId") Long bbstId) {
		
		String email = (String)session.getAttribute("email");
		Long memberId = mservice.getMemberIdName(email).getMemberId();
		String name = mservice.getMemberIdName(email).getName();
		bbstReply.setMemberId(memberId);
		bbstReply.setName(name);
		
		log.info("========== GET BBST REPLY LIST ==========");
		
		BbstReplyCriteria cri = new BbstReplyCriteria(page, 10);
		log.info("========== GET BBST REPLY LIST BBSTID: " + bbstId + " ==========");
		log.info("========== CRI: " + cri + " ==========");
		
		return new ResponseEntity<> (service.getBbstReplyListPage(cri, bbstId), HttpStatus.OK);
	}
}
