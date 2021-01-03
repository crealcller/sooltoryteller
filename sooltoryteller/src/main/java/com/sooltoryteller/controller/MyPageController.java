package com.sooltoryteller.controller;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sooltoryteller.domain.MyCntVO;
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
	
	@GetMapping("/like")
	public void myLikeList(Model model, Long memberId, HttpServletRequest request) {

		//세션에서 회원 email 가져옴
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		
		//로그인 상태일때만 접근가능
		if (email == null) {
			model.addAttribute("msg", "로그인이 필요한 페이지 입니다.");
		}else {
			//가져온 이메일로 회원아이디 찾아서 모델에 담아줌
			memberId =  memberService.getMemberId(email);
			model.addAttribute("member", memberService.get(email));
			log.info(memberId+" : my like page");
		}
	}
	
	@GetMapping("/revw")
	public void myRevwList(Model model, Long memberId, HttpServletRequest request) {
		
			//세션에서 회원 email 가져옴
			HttpSession session = request.getSession();
			String email = (String) session.getAttribute("email");
			
			//로그인 상태일때만 접근가능
			if (email == null) {
				model.addAttribute("msg", "로그인이 필요한 페이지 입니다.");
			}else {
				//가져온 이메일로 회원아이디 찾아서 모델에 담아줌
				memberId =  memberService.getMemberId(email);
				model.addAttribute("member", memberService.get(email));
				log.info(memberId+" : my revw page");
			}
	}
	
	// 내가 쓴 게시글 리스트
	@GetMapping("/mypost")
	public void getMyBbstList(Long memberId, Model model, HttpServletRequest request) {
		
		// 세션에서 회원 email 가져옴
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		
		//로그인 상태일때만 접근가능
		if (email == null) {
			model.addAttribute("msg", "로그인이 필요한 페이지 입니다.");
		}else {
			//가져온 이메일로 회원아이디 찾아서 모델에 담아줌
			memberId = memberService.getMemberId(email);
			model.addAttribute("member", memberService.get(email));
			log.info("MEMBERID " + memberId + "'S POST PAGE");
		}
	}
	
	// 내가 쓴 댓글 리스트
	@GetMapping("/myreply")
	public void getMyBbstComment(Long memberId, Model model, HttpServletRequest request) {
		
		//세션에서 회원 email 가져옴
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		
		//로그인 상태일때만 접근가능
		if (email == null) {
			model.addAttribute("msg", "로그인이 필요한 페이지 입니다.");
		}else {
		//가져온 이메일로 회원아이디 찾아서 모델에 담아줌
			memberId = memberService.getMemberId(email);
			model.addAttribute("member", memberService.get(email));
			log.info("MEMBERID " + memberId + "'S COMMENT PAGE");
		}
	}
	
	// 내가 좋아요 누른 게시글 리스트
	@GetMapping("/mylikedpost")
	public void getMyBbstLike(Long memberId, Model model, HttpServletRequest request) {
		
		//세션에서 회원 email 가져옴
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		
		//로그인 상태일때만 접근가능
		if (email == null) {
			model.addAttribute("msg", "로그인이 필요한 페이지 입니다.");
		}else {
			//가져온 이메일로 회원아이디 찾아서 모델에 담아줌
			memberId = memberService.getMemberId(email);
			model.addAttribute("member", memberService.get(email));
			log.info("MEMBERID " + memberId + "'S LIKED BBST PAGE");
		}
	}
	
	// 마이페이지 - 게시글 (main)
	// 내 게시글 활동 현황
	@RequestMapping(value="/myactivity", method=RequestMethod.GET)
	public void getMyCnt(HttpSession session, Model model) {
		
		String email = (String)session.getAttribute("email");
		
		if(email == null) {
			model.addAttribute("msg", "로그인이 필요한 페이지 입니다.");
		} else {
			Long memberId = memberService.getMemberId(email);
			
			// 게시글수, 댓글수, 좋아요수 이름
			String[] getCntName = {"게시글수", "댓글수", "좋아요수"};
			// 게시글수, 댓글수, 좋아요수 수치
			Long[] cnt = bbstService.getMyCnt(memberId);
			log.info("========== MY CNT LIST: " + cnt + " ==========");
			
			String str = "[";
			str += "['내 게시글 활동 현황', '개수'],";
			int num = 0;
			
			for(int i = 0; i < getCntName.length; i++) {
				str += "['";
				str += getCntName[i];
				str += "', ";
				str += cnt[i];
				str += "]";
				
				num++;
				
				if(num < getCntName.length) {
					str += ", ";
				}
			}
			str += "]";
			model.addAttribute("data", str);
			model.addAttribute("bCnt", cnt[0]);
			model.addAttribute("rCnt", cnt[1]);
			model.addAttribute("lCnt", cnt[2]);
			model.addAttribute("member", memberService.get(email));
		}
	}
}
