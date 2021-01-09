package com.sooltoryteller.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/shop/*")
public class ShopController {

//--------------------------------현수작업--------------------------------	
	
	//장바구니
	@GetMapping("/basket")
	public void basket() {}
	
//--------------------------------현수작업 끝------------------------------	
}
