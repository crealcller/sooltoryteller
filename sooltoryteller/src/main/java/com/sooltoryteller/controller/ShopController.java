package com.sooltoryteller.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sooltoryteller.domain.BasketVO;
import com.sooltoryteller.domain.ItemListDTO;
import com.sooltoryteller.domain.LiqVO;
import com.sooltoryteller.domain.OrderDTO;
import com.sooltoryteller.service.BasketService;
import com.sooltoryteller.service.KakaoService;
import com.sooltoryteller.service.LiqService;
import com.sooltoryteller.service.MemberService;
import com.sooltoryteller.service.OrderService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/shop/*")
public class ShopController {

	private BasketService basketService;
	private MemberService memberService;
	private LiqService liqService;
	private OrderService ordService;
	@Setter(onMethod_ = @Autowired)
	private KakaoService kakaoService;
	
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
	public String register(BasketVO basket, RedirectAttributes rttr, HttpSession session) {
		
		log.info("장바구니 등록! : "+basket);
		
		String email = (String) session.getAttribute("email");
		if (email == null) {
			rttr.addFlashAttribute("msg", "로그인이 필요한 페이지 입니다.");
			
		} else {
			Long memberId = memberService.getMemberId(email);
			basket.setMemberId(memberId);
			basketService.register(basket);
			
			rttr.addFlashAttribute("result", basket.getBasketId());
		}
		
		
		return "redirect:/shop/basket";
	}
	
	//장바구니 수량 수정
	@RequestMapping(value = "/basket/modify", method = RequestMethod.POST)
	@ResponseBody
	public String modify(BasketVO basket) {
		
		log.info("수량 변경! : "+basket);
		
		if(basketService.modify(basket)) {
			return "success";
			}
		return "fail";
		}
	
	//장바구니 삭제
	@RequestMapping(value = "/basket/remove", method = RequestMethod.POST)
	@ResponseBody
	public String remove(Long memberId, Long liqId) {
		
		log.info("장바구니 삭제" + liqId);
		
		if(basketService.remove(memberId, liqId)) {
			return "success";
		}
		return "fail";
	}
//--------------------------------현수작업 끝------------------------------	
	
	
	@GetMapping("/order")
	public void getOrdInfo(HttpSession session, Model model) {
		// 로그인 유무 체크
		String email = (String)session.getAttribute("email");
		if(email == null) {
			model.addAttribute("msg", "로그인이 필요한 페이지 입니다.");
		}
	}
	
	@PostMapping("/order")
	public void getOrdInfo(HttpSession session, Model model, ItemListDTO itemList) {
		List<LiqVO> liqs = new ArrayList<>();
		
		// 로그인 유무 체크
		String email = (String)session.getAttribute("email");
		if(email == null) {
			model.addAttribute("msg", "로그인이 필요한 페이지 입니다.");
		} else {
			for(int i = 0; i < itemList.size(); i++) {
				Long liqIds = itemList.getItems().get(i).getLiqId();
				liqs.add(liqService.get(liqIds));
			}
			
			// liqVO 관련 정보
			model.addAttribute("liq", liqs);
			// 상품번호, 상품단가, 주문수량 리스트
			model.addAttribute("itemList", itemList);
			log.info(itemList);
			
			// 배송지 정보
			
			// 주문자 정보
			model.addAttribute("member", memberService.get(email));
			
			// DB에 데이터 넣기
//			ordService.insertOrd();
//			ordService.insertOrdDtl();
//			ordService.insertOrdHist();
		}

	}

	
	@PostMapping("/kakaoPay")
	public String kakaoPay(OrderDTO orderDTO, HttpSession session, Model model) {
		log.info("kakaoPay post............................................");
		log.info(orderDTO);
		// 수빈
		// 로그인 유무 체크
		String email = (String)session.getAttribute("email");
		if(email == null) {
			model.addAttribute("msg", "로그인이 필요한 페이지 입니다.");
		} else {
			memberService.get(email);
			// DB에 데이터 넣기
			ordService.insertOrd();
			ordService.insertOrdDtl();
			ordService.insertOrdHist();
		}
		return "redirect:" + kakaoService.kakaoPayReady(orderDTO);
	}

	@GetMapping("/kakaoPaySuccess")
	public void kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model) {
		log.info("kakaoPaySuccess get............................................");
		log.info("kakaoPaySuccess pg_token : " + pg_token);
		model.addAttribute("info", kakaoService.kakaoPayInfo(pg_token));
	}

}
