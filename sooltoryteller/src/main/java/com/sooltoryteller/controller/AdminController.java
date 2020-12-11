package com.sooltoryteller.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sooltoryteller.domain.LiqCoVO;
import com.sooltoryteller.service.LiqService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/admin")
public class AdminController {

	private LiqService service;
	
	@GetMapping("/liq-register")
	public void liq() {
	}
	
	
	@GetMapping("/liq-co-register")
	public void liqCo() {
	}
	
	@PostMapping("/liq-co-register")
	public String liqCoRegister(LiqCoVO vo) {
		log.info("result : "+service.registerLiqCo(vo));
		return "redirect:/admin/complete";
	}
}
