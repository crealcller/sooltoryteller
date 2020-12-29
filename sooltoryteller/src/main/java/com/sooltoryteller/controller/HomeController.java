package com.sooltoryteller.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sooltoryteller.service.BbstService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/**
 * 임현수
 * 메인페이지 화면
 */
@Controller
@Log4j
@AllArgsConstructor
public class HomeController {
	
	private BbstService bbstService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		log.info("========== GET BBST LIST BY VIEW ==========");
		model.addAttribute("bbstList", bbstService.getBbstByView());
		
		return "home";
	}
}
