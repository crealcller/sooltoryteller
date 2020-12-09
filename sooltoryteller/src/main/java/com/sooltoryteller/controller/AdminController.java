package com.sooltoryteller.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sooltoryteller.domain.AdminCriteria;
import com.sooltoryteller.domain.AdminPageDTO;
import com.sooltoryteller.service.AdminService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class AdminController {

	private AdminService service;
	
	//관리자 메인 페이지
	@GetMapping("/admin")
	public void admin() {}
	
	//관리자-회원리스트페이지
	@GetMapping("/admin/memberlist")
	public void memberlist(AdminCriteria adCri, Model model) {
		
		log.info("memberList : "+adCri);
		
		model.addAttribute("memberlist", service.getList(adCri));
		
		int total = service.getTotal(adCri);
		
		log.info("total: "+total);
		
		model.addAttribute("pageMaker", new AdminPageDTO(adCri, total));
	}
	
}
