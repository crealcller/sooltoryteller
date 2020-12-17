package com.sooltoryteller.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sooltoryteller.domain.BbstCriteria;
import com.sooltoryteller.domain.MyBbstPageDTO;
import com.sooltoryteller.service.BbstService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@AllArgsConstructor
@RequestMapping("/mybbst/")
public class MyBbstController {
	
	private BbstService service;

	// 마이페이지
	// 내가 쓴 게시글 리스트
	@GetMapping(value="/pages/{memberId}/{page}",
		produces= {
			MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE
	})
	public ResponseEntity<MyBbstPageDTO> getMyBbstList(
			@PathVariable("page") int page,
			@PathVariable("memberId") Long memberId) {

		BbstCriteria cri = new BbstCriteria(page, 9);
		log.info("========== MEMBERID " + memberId + "'S BBST LIST==========");
		log.info("========== " + cri + " ==========");

		return new ResponseEntity<>(service.getMyBbstList(cri, memberId), HttpStatus.OK);
	}
}
