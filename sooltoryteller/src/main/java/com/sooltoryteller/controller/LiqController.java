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
	
	@GetMapping("/all-liq")
	public void allLiq(Model model) {
		log.info("get allLiq......");
		model.addAttribute("allLiq", service.getAll());
	}
	@GetMapping("/takju")
	public void allTakju(Model model) {
		model.addAttribute("allLiq", service.getAllByKind("탁주"));
	}
	
	@GetMapping("/yakju-cheongju")
	public void allYakjuCheongju(Model model) {
		model.addAttribute("allLiq", service.getAllByKind("약주 청주"));
	}
	
	@GetMapping("/fruit-wine")
	public void allFruitWine(Model model) {
		model.addAttribute("allLiq", service.getAllByKind("과실주"));
	}
	
	@GetMapping("/distilled-spirits")
	public void allDistilledSpirits(Model model) {
		model.addAttribute("allLiq", service.getAllByKind("증류주"));
	}
	
	
	@GetMapping("/others")
	public void allOthers(Model model) {
		model.addAttribute("allLiq", service.getAllByKind("기타류"));
	}
	
	
}
