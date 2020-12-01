package com.sooltoryteller.controller;

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

import com.sooltoryteller.domain.Criteria;
import com.sooltoryteller.domain.LiqRevwPageDTO;
import com.sooltoryteller.domain.LiqRevwVO;
import com.sooltoryteller.service.LiqRevwService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/revws/")
@RestController
@Log4j
@AllArgsConstructor
public class LiqRevwController {

	private LiqRevwService service;
	
	@PostMapping(value="/new",
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody LiqRevwVO vo){
		log.info("LiqRevwVO:"+ vo);
		int result = service.register(vo);
		
		return result == 1
				?new ResponseEntity<>("success",HttpStatus.OK)
				:new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value="/pages/{liqSeq}/{page}",
			produces= {
					MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE
			})
	public ResponseEntity<LiqRevwPageDTO> getList(
			@PathVariable("page") int page,
			@PathVariable("liqSeq") Long liqSeq){
		
		Criteria cri = new Criteria(page,5);
		log.info("get revw list liqSeq:" +liqSeq);
		log.info("cri: "+cri);
		
		return new ResponseEntity<>(service.getListPage(liqSeq, cri), HttpStatus.OK);
	}
	
	@GetMapping(value="/{revwSeq}",
			produces= {MediaType.APPLICATION_XML_VALUE,
					   MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<LiqRevwVO> get(@PathVariable("revwSeq")Long revwSeq){
		log.info("get: "+revwSeq);
		
		return new ResponseEntity<>(service.get(revwSeq),HttpStatus.OK);
	}
	
	@DeleteMapping(value="/{revwSeq}",produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("revwSeq")Long revwSeq){
		
		return service.remove(revwSeq) == 1?
				new ResponseEntity<>("success",HttpStatus.OK)
				:new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
	
	@RequestMapping(method = {RequestMethod.PUT,RequestMethod.PATCH},
			value="/{revwSeq}",
			consumes ="application/json",
			produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> update(
			@RequestBody LiqRevwVO vo,
			@PathVariable("revwSeq") Long revwSeq){
		vo.setRevwId(revwSeq);
		log.info("revwSeq : "+revwSeq);
		log.info("modify: "+vo);
		return service.modify(vo) ==1?
				new ResponseEntity<>("success",HttpStatus.OK)
				:new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	
}
