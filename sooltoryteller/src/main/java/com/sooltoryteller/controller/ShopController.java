package com.sooltoryteller.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sooltoryteller.domain.BasketVO;
import com.sooltoryteller.service.BasketService;
import com.sooltoryteller.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/shop/*")
public class ShopController {

//--------------------------------현수작업--------------------------------	
	private BasketService basketService;
	private MemberService memberService;
	
	//장바구니
	@GetMapping("/basket")
	public void basket(Model model, HttpSession session) {
		
		log.info("장바구니 목록");
		
		//로그인한 회원정보
		String email = (String) session.getAttribute("email");
		if (email == null) {
			model.addAttribute("msg", "로그인이 필요한 페이지 입니다.");
		} else {
			Long memberId = memberService.getMemberId(email);
			model.addAttribute("list", basketService.getList(memberId));
		}
	}
	
	//장바구니 등록
	@PostMapping("/basket/register")
	public String register(BasketVO basket, RedirectAttributes rttr) {
		
		log.info("장바구니 등록! : "+basket);
		
		basketService.register(basket);
		
		rttr.addFlashAttribute("result", basket.getBasketId());
		
		return "redirect:/shop/basket";
	}
	
	//장바구니 수량 수정
	@PostMapping("/basket/modify")
	public String modify(BasketVO basket, RedirectAttributes rttr) {
		
		log.info("수량 변경! : "+basket);
		
		if(basketService.modify(basket)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/shop/basket";
	}
	
	@PostMapping("/basket/remove")
	public String remove(Long memberId, Long liqId, RedirectAttributes rttr) {
		
		log.info("장바구니 삭제" + liqId);
		
		if(basketService.remove(memberId, liqId)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/shop/basket";
	}
//--------------------------------현수작업 끝------------------------------	
}
