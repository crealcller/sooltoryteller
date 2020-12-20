package com.sooltoryteller.controller;

import javax.validation.Valid;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.sooltoryteller.domain.Criteria;
import com.sooltoryteller.domain.LiqRevwPageDTO;
import com.sooltoryteller.domain.LiqRevwVO;
import com.sooltoryteller.domain.MyRevwPageDTO;
import com.sooltoryteller.service.LiqRevwService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/revws/")
@RestController
@Log4j
@AllArgsConstructor
public class LiqRevwController {

	private LiqRevwService service;

	// 리뷰 작성
	@PostMapping(value = "/new", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> create(@RequestBody LiqRevwVO vo) {
		log.info("LiqRevwVO:" + vo);

		int result = service.register(vo);
		
		return result == 1 ? new ResponseEntity<>("success", HttpStatus.OK):new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	// 페이지와 함께 리뷰리스트 가져오기
	@GetMapping(value = "/pages/{liqId}/{page}", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<LiqRevwPageDTO> getList(@PathVariable("page") int page, @PathVariable("liqId") Long liqId) {

		Criteria cri = new Criteria(page, 3);
		log.info("get revw list liqId:" + liqId);
		log.info("cri: " + cri);

		return new ResponseEntity<>(service.getListWtihPaging(liqId, cri), HttpStatus.OK);
	}

	// 리뷰만 가져오기(한개)
	@GetMapping(value = "/{revwId}", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<LiqRevwVO> get(@PathVariable("revwId") Long revwId) {
		log.info("get: " + revwId);

		return new ResponseEntity<>(service.get(revwId), HttpStatus.OK);
	}

	// 리뷰 삭제
	@DeleteMapping(value = "/{revwId}", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> remove(@PathVariable("revwId") Long revwId) {

		return service.remove(revwId) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

	}

	// 리뷰 수정
	@RequestMapping(method = { RequestMethod.PUT,
			RequestMethod.PATCH }, value = "/{revwId}", consumes = "application/json", produces = {
					MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> update(@RequestBody LiqRevwVO vo, @PathVariable("revwId") Long revwId) {
		vo.setRevwId(revwId);
		log.info("revwId : " + revwId);
		log.info("modify: " + vo);
		return service.modify(vo) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	// 페이지와 함께 해당회원이 작성한리뷰리스트 가져오기
	@GetMapping(value = "/my/pages/{memberId}/{page}", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<MyRevwPageDTO> getMyList(@PathVariable("page") int page,
			@PathVariable("memberId") Long memberId) {

		Criteria cri = new Criteria(page, 4);
		log.info("get my revw list memberId:" + memberId);
		log.info("cri: " + cri);

		return new ResponseEntity<>(service.getMyListWithPaging(memberId, cri), HttpStatus.OK);
	}

}
