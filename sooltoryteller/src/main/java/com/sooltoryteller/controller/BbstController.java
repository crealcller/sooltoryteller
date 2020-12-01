package com.sooltoryteller.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sooltoryteller.domain.BbstVO;
import com.sooltoryteller.service.BbstService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/cheers/*")
@AllArgsConstructor
public class BbstController {

	private BbstService service;
	
	@GetMapping("/list")
	public void getBbstList(Model model) {
		log.info("GET BBST LIST");
		System.out.println("==========" + service.getBbstList());
		model.addAttribute("bbstList", service.getBbstList());
	}
	
	@PostMapping("/register")
	public String register(BbstVO bbst, RedirectAttributes rttr) {
		log.info("========== REGISTER: " + bbst + " ==========");
		service.registerBbst(bbst);
		rttr.addFlashAttribute("result", bbst.getBbstId());
		
		return "redirect:/cheers/list";
	}
	
	@GetMapping("/get")
	public void get(@RequestParam("bbstId") Long bbstId, Model model) {
		log.info("========== /get ==========");
		model.addAttribute("bbst", service.getBbst(bbstId));
	}
	
	@PostMapping("/modify")
	public String modify(BbstVO bbst, RedirectAttributes rttr) {
		log.info("========== MODIFY: " + bbst + " ==========");
		
		if(service.modifyBbst(bbst)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/cheers/list";
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("bbstId") Long bbstId, RedirectAttributes rttr) {
		log.info("========== REMOVE BBSTID: " + bbstId + " ==========");
		
		if(service.removeBbst(bbstId)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/cheers/list";
	}
}