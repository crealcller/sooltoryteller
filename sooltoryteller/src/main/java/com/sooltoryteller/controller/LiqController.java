package com.sooltoryteller.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sooltoryteller.service.LiqService;
import com.sooltoryteller.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class LiqController {

	private LiqService service;
	private MemberService memberService;
	
	//전통주 상세 페이지
	@GetMapping("/trad-liq")
	public void liq(Long liqId, Model model, HttpServletRequest request) {
		log.info("get liq........."+liqId);
		
		//세션에서 회원 email 가져옴
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		
		if(email != null) {
		
		//로그인 상태라면 가져온 이메일로 회원아이디 찾아서 모델에 담아줌
		model.addAttribute("member", memberService.get(email));
		}
			
		model.addAttribute("liq", service.get(liqId));
	}
	
	//전체 리스트
	@GetMapping("/all-liq")
	public void allLiq(Model model) {
		log.info("get allLiq......");
		model.addAttribute("allLiq", service.getLiqList());
	}
	
	//주종별 리스트
	@GetMapping("/liq-list")
	public void allDistilledSpirits(Model model, String kind) {
		model.addAttribute("kind", kind);
		model.addAttribute("allLiq", service.getLiqListByKind(kind));
	}
	
	
	
	
}
