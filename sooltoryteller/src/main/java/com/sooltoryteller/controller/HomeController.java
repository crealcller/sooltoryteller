package com.sooltoryteller.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sooltoryteller.service.BbstService;
import com.sooltoryteller.service.MemberFavDrkService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/**
 * 임현수
 * 메인페이지 화면
 */
@Controller
@Log4j
@AllArgsConstructor
public class HomeController {
	
	private MemberFavDrkService favDrkService;
	private BbstService bbstService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		model.addAttribute("bbstList", bbstService.getBbstByView());
		log.info("========== GET BBST LIST BY VIEW ==========");
		
		int[] drkId = {1,2,3,4,5,6,7,8};
		String[] drkNameArr = favDrkService.getFavNameList(drkId);//주종이름
		int[] cntArr = favDrkService.getFavCnt(drkId); //주종 카운트
		
		String str = "[";
		str += "['선호하는 주종', 'COUNT'],";
		int num = 0;
		
		for (int i = 0; i < drkId.length; i++) {
			
			str +="['";
			str += drkNameArr[i];
			str +="' , ";
			str += cntArr[i];
			str +=" ]";
			
			num++;
			
			if(num < drkId.length) {
				str += ",";
			}
		}
		
		str += "]";
		
		model.addAttribute("bbstList", bbstService.getBbstByView());
		model.addAttribute("data", str);
		
		return "home";
	}
}

