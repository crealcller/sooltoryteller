package com.sooltoryteller.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/soolbti/*")
public class SoolBTIController {

	@GetMapping("/roulette")
	public void roulette() {
		log.info("roulette page");
	}
}
