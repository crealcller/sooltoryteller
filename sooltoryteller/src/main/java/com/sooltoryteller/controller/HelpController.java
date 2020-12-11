package com.sooltoryteller.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sooltoryteller.domain.AdminCriteria;
import com.sooltoryteller.domain.AdminPageDTO;
import com.sooltoryteller.service.FaqService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/help/*")
public class HelpController {

	private FaqService faqService;
	
	//고객센터 메인페이지(자주묻는질문)
	@GetMapping("/faq")
	public void faq(AdminCriteria adCri, Model model) {
		log.info("faqlist:"+adCri);
		
		model.addAttribute("faq", faqService.getList(adCri));
		
		int total = faqService.getTotal(adCri);
		
		log.info("total: "+total);
		
		model.addAttribute("pageMaker", new AdminPageDTO(adCri, total));
	}
}
