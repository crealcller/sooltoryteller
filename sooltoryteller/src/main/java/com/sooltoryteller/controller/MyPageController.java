package com.sooltoryteller.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sooltoryteller.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/mypage/*")
public class MyPageController {

	private MemberService memberService;
	
	@GetMapping("/like")
	public String myLikeList(Model model, Long memberId,HttpServletRequest request) {
		//세션에서 회원 email 가져옴
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		//로그인 상태일때만 접근가능
		if(email != null) {
		//가져온 이메일로 회원아이디 찾아서 모델에 담아줌
		memberId =  memberService.getMemberId(email);
		model.addAttribute("member", memberService.get(email));
		log.info(memberId+" : my like page");
		
		return "/mypage/like";
		}
		//로그인 상태가 아니라면 login 페이지로  redirect
		return "redirect:/login";
	}
	
	@GetMapping("/revw")
	public String myRevwList(Model model, Long memberId,HttpServletRequest request) {
			//세션에서 회원 email 가져옴
			HttpSession session = request.getSession();
			String email = (String) session.getAttribute("email");
			//로그인 상태일때만 접근가능
			if(email != null) {
			//가져온 이메일로 회원아이디 찾아서 모델에 담아줌
			memberId =  memberService.getMemberId(email);
			model.addAttribute("member", memberService.get(email));
			log.info(memberId+" : my revw page");
			
			return "/mypage/revw";
			}
			//로그인 상태가 아니라면 login 페이지로  redirect
			return "redirect:/login";
	}
	
}
