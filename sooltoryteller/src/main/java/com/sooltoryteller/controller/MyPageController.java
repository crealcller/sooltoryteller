package com.sooltoryteller.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sooltoryteller.domain.BbstCriteria;
import com.sooltoryteller.domain.BbstPageDTO;
import com.sooltoryteller.domain.MyBbstPageDTO;
import com.sooltoryteller.service.BbstReplyService;
import com.sooltoryteller.service.BbstService;
import com.sooltoryteller.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/mypage/*")
public class MyPageController {

	private MemberService memberService;
	private BbstService bbstService;
	private BbstReplyService replyService;
	
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
	
	// 내가 쓴 게시글 리스트
	@GetMapping("/mypost")
	public String getMyBbstList(HttpSession session, Long memberId, Model model) {
		// 세션에서 회원 email 가져옴
		String email = (String)session.getAttribute("email");
		//로그인 상태일때만 접근가능
		if(email != null) {
			//가져온 이메일로 회원아이디 찾아서 모델에 담아줌
			memberId = memberService.getMemberId(email);
			model.addAttribute("member", memberService.get(email));
			log.info("MEMBERID " + memberId + "'S POST PAGE");
			
			return "/mypage/mypost";
		}
		//로그인 상태가 아니라면 login 페이지로  redirect
		return "redirect:/login";
	}
	
	// 내가 쓴 댓글 리스트
	@GetMapping("/myreply")
	public String getMyBbstComment(HttpSession session, Long memberId, Model model) {
		// 세션에서 회원 email 가져옴
		String email = (String)session.getAttribute("email");
		//로그인 상태일때만 접근가능
		if(email != null) {
			//가져온 이메일로 회원아이디 찾아서 모델에 담아줌
			memberId = memberService.getMemberId(email);
			model.addAttribute("member", memberService.get(email));
			log.info("MEMBERID " + memberId + "'S COMMENT PAGE");
			
			return "/mypage/myreply";
		}
		//로그인 상태가 아니라면 login 페이지로  redirect
		return "redirect:/login";
	}
	
	// 내가 좋아요 누른 게시글 리스트
	@GetMapping("/mylikedpost")
	public String getMyBbstLike(HttpSession session, Long memberId, Model model) {
		// 세션에서 회원 email 가져옴
		String email = (String)session.getAttribute("email");
		//로그인 상태일때만 접근가능
		if(email != null) {
			//가져온 이메일로 회원아이디 찾아서 모델에 담아줌
			memberId = memberService.getMemberId(email);
			model.addAttribute("member", memberService.get(email));
			log.info("MEMBERID " + memberId + "'S LIKED BBST PAGE");
			
			return "/mypage/mylikedpost";
		}
		//로그인 상태가 아니라면 login 페이지로  redirect
		return "redirect:/login";
	}
}
