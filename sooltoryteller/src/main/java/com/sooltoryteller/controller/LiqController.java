package com.sooltoryteller.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sooltoryteller.service.LiqService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class LiqController {

	private LiqService service;
	
	@GetMapping("/trad-liq")
	public void liq(Long liqSeq, Model model) {
		log.info("get liq........."+liqSeq);
		model.addAttribute("liq", service.get(liqSeq));
	}
}
