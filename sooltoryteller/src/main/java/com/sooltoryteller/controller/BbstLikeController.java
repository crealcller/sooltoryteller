package com.sooltoryteller.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sooltoryteller.domain.BbstLikeCriteria;
import com.sooltoryteller.domain.MyBbstLikePageDTO;
import com.sooltoryteller.service.BbstLikeService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@AllArgsConstructor
@RequestMapping("/bbstLike/")
public class BbstLikeController {

	@Setter(onMethod_ = @Autowired)
	private BbstLikeService service;
	
	// 좋아요 상태 (1: true(좋아요), 2: false(좋아요 취소))
	@GetMapping(value = "/{memberId}/{bbstId}",
		produces = {
			MediaType.APPLICATION_ATOM_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE})
	public boolean bbstLikeStus(
		@PathVariable("memberId") Long memberId,
		@PathVariable("bbstId") Long bbstId) {
		
		return service.bbstLikeStus(bbstId, memberId);
	}
	
	// 좋아요
	@PostMapping(value = "/new/{memberId}/{bbstId}",
		produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> likeBbst(
		@PathVariable("memberId") Long memberId,
		@PathVariable("bbstId") Long bbstId) {
		
		try {
			int result = service.likeBbst(bbstId, memberId);
			return new ResponseEntity<>("result", HttpStatus.OK);
		} catch(Exception e) {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	// 좋아요 취소
	@DeleteMapping(value = "/{memberId}/{bbstId}",
		produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> cancelLikeBbst(
		@PathVariable("memberId") Long memberId,
		@PathVariable("bbstId") Long bbstId) {
		
		return service.cancelLikeBbst(bbstId, memberId)
			? new ResponseEntity<>("success", HttpStatus.OK)
			: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 마이페이지
	// 내가 좋아요 누른 게시글 리스트
	@GetMapping(value = "/mypages/{memberId}/{page}",
		produces = {
			MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<MyBbstLikePageDTO> getMyBbstLike(
		@PathVariable("page") int page,
		@PathVariable("memberId") Long memberId) {
		
		BbstLikeCriteria cri = new BbstLikeCriteria(page, 9);
		log.info("========== MEMBERID " + memberId + "'S LIKED BBST PAGE");
		log.info("========== CRI: " + cri + " ==========");
		
		return new ResponseEntity<>(service.getMyBbstLike(cri, memberId), HttpStatus.OK);
	}
}
