package com.sooltoryteller.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sooltoryteller.domain.OrderDTO;
import com.sooltoryteller.service.KakaoService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class TestController {
	
	@Setter(onMethod_ = @Autowired)
    private KakaoService kakaoService;
    
    
    @GetMapping("/kakaoPay")
    public void kakaoPayGet() {
        
    }
    
    @PostMapping("/kakaoPay")
    public String kakaoPay(OrderDTO orderDTO) {
        log.info("kakaoPay post............................................");
        orderDTO = new OrderDTO();
        return "redirect:" + kakaoService.kakaoPayReady(orderDTO);
 
    }
    
    @GetMapping("/kakaoPaySuccess")
    public void kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model,OrderDTO orderDTO) {
        log.info("kakaoPaySuccess get............................................");
        log.info("kakaoPaySuccess pg_token : " + pg_token);
        orderDTO = new OrderDTO();
        model.addAttribute("info", kakaoService.kakaoPayInfo(pg_token,orderDTO));
        
    }	
	@GetMapping("/jusoForm")
	public void getAddress() {
		
	}
}
