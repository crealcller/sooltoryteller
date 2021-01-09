package com.sooltoryteller.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sooltoryteller.service.LiqService;
import com.sooltoryteller.service.MemberService;
import com.sooltoryteller.service.OrderService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/shop/*")
public class ShopController {

	private LiqService liq;
	private OrderService order;
	private MemberService member;
	
	// 1. 구매하기 버튼에서 바로 넘어오기
	// 상품 사진, 상품 정보, 주문 수량, 판매자, 배송비, 주문금액 (단가 x 수량)
	@GetMapping("/order")
	public void getOrdInfo(HttpSession session, Model model) {
		
		// 로그인 유무 체크
		String email = (String)session.getAttribute("email");
		if(email == null) {
			model.addAttribute("msg", "로그인이 필요한 페이지 입니다.");
		} else {
		}
	}
	
	@PostMapping("/order")
	public void getOrdInfo(HttpSession session, Model model, Long liqId, Long memberId) {
		// 로그인 유무 체크
		String email = (String)session.getAttribute("email");
		if(email == null) {
			model.addAttribute("msg", "로그인이 필요한 페이지 입니다.");
		} else {
			log.info("***** liqId: " + liqId);
			// 1. 구매하기 버튼에서 바로 넘어오기
//			model.addAttribute("order", order.getOneLiqInfo(liqId));
			model.addAttribute("liq", liq.get(liqId));
			
			// 주문자 정보
			log.info("***** orderer: " + memberId);
			// 주문자 닉네임
			model.addAttribute("orderer", member.getMemberIdName(email));
			// 주문자 이메일
			model.addAttribute("email", email);
			
			// 주문 전체 내역
			// 주문 항목 목록
			
			//
		}
	}
}
