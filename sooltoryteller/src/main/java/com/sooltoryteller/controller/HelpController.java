package com.sooltoryteller.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sooltoryteller.domain.AdminCriteria;
import com.sooltoryteller.domain.AdminPageDTO;
import com.sooltoryteller.domain.InquiryVO;
import com.sooltoryteller.service.FaqService;
import com.sooltoryteller.service.InquiryAnswerService;
import com.sooltoryteller.service.InquiryService;
import com.sooltoryteller.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/help/*")
public class HelpController {

	private FaqService faqService;
	private InquiryAnswerService inqAnService;
	private InquiryService inqService;
	private MemberService memberService;
	
	//고객센터 메인페이지(자주묻는질문)
	@GetMapping("/faq")
	public void faq(AdminCriteria adCri, Model model) {
		log.info("faqlist:"+adCri);
		
		model.addAttribute("faq", faqService.getList(adCri));
		
		int total = faqService.getTotal(adCri);
		
		log.info("total: "+total);
		
		model.addAttribute("pageMaker", new AdminPageDTO(adCri, total));
	}
	
	//자주묻는 질문 조회
	@GetMapping("/faqget")
	public void faqget(@RequestParam("faqId") Long faqId, @ModelAttribute("adCri")
	AdminCriteria adCri, Model model) {
		log.info("/faqget");
		model.addAttribute("faq", faqService.get(faqId));
	}

	//1:1문의 등록
	@GetMapping("/inquiryregister")
	public void inquiryregister(HttpSession session, Model model) {
		String email = (String) session.getAttribute("email");
		if (email == null) {
			model.addAttribute("msg", "로그인이 필요한 페이지 입니다.");
		}else {
			model.addAttribute("memberId", memberService.getMemberId(email));
		}
		
	}
	
	@PostMapping("/inquiryregister")
	public String inquiryregister(@Valid InquiryVO inq, BindingResult result, Model model,
			RedirectAttributes rttr) {
		
		log.info("inquiry register...."+inq);
		
		//에러발생시
		if(result.hasErrors()) {
			model.addAttribute("errorMsg",  "입력형식이 잘 못 되었습니다.");
			return "/help/inquiryregister";
		}
		
		inqService.register(inq);
		
		rttr.addFlashAttribute("result", inq.getInquiryId());
		
		//1:1문의 조회 리스트 만들변 변경해야함 list로 이동하게끔
		return "redirect:/help/inquiryregister";
	}
	
}
