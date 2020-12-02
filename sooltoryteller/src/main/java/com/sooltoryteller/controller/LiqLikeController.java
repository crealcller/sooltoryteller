package com.sooltoryteller.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.sooltoryteller.domain.LiqRevwVO;
import com.sooltoryteller.service.LiqLikeService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@AllArgsConstructor
@RequestMapping("/like/")
public class LiqLikeController {
	
	@Setter(onMethod_ =@Autowired )
	private LiqLikeService service;

	//좋아요 상태 가져오기 (1->true, 0->false)
	@GetMapping(value="/{memberId}/{liqId}",
					produces= {
							MediaType.APPLICATION_XML_VALUE,
							MediaType.APPLICATION_JSON_UTF8_VALUE})
	public boolean get(
			@PathVariable("memberId")Long memberId,
			@PathVariable("liqId")Long liqId){
		
		return service.checkLike(memberId, liqId);
	}
	
	//좋아요 추가
	@PostMapping(value="/new/{memberId}/{liqId}",
			produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> like(
			@PathVariable("memberId")Long memberId,
			@PathVariable("liqId")Long liqId){
		
		return service.like(memberId, liqId)
				?new ResponseEntity<>("success",HttpStatus.OK)
				:new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//좋아요 삭제
	@DeleteMapping(value="/{memberId}/{liqId}",
			produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> cancelLike(
			@PathVariable("memberId")Long memberId,
			@PathVariable("liqId")Long liqId){
		
		return service.cancelLike(memberId, liqId)?
				new ResponseEntity<>("success",HttpStatus.OK)
				:new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
	
	
}
