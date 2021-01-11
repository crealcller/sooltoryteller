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
	

	@GetMapping("/jusoForm")
	public void getAddress() {
		
	}
}
