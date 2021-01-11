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
import org.springframework.web.bind.annotation.RequestParam;

import com.sooltoryteller.domain.ItemListDTO;
import com.sooltoryteller.domain.LiqVO;
import com.sooltoryteller.domain.OrderDTO;
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

	private LiqService liqService;
	private MemberService memberService;
	private OrderService ordService;
	
	@Setter(onMethod_ = @Autowired)
	private KakaoService kakaoService;
	
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

	@GetMapping("/kakaoPay")
	public void kakaoPayGet() {

	}

	@PostMapping("/kakaoPay")
	public String kakaoPay(OrderDTO orderDTO, HttpSession session, Model model) {
		log.info("kakaoPay post............................................");
		orderDTO = new OrderDTO();
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
	public void kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model, OrderDTO orderDTO) {
		log.info("kakaoPaySuccess get............................................");
		log.info("kakaoPaySuccess pg_token : " + pg_token);
		orderDTO = new OrderDTO();
		model.addAttribute("info", kakaoService.kakaoPayInfo(pg_token, orderDTO));
	}
}
