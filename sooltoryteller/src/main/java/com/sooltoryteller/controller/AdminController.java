package com.sooltoryteller.controller;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sooltoryteller.domain.AdminCriteria;
import com.sooltoryteller.domain.AdminPageDTO;
import com.sooltoryteller.domain.FaqVO;
import com.sooltoryteller.service.AdminService;
import com.sooltoryteller.service.FaqService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class AdminController {

	private AdminService adService;
	private FaqService faqService;
	
	//관리자 메인 페이지
	@GetMapping("/admin")
	public void admin() {}
	
	//관리자-회원리스트페이지
	@GetMapping("/admin/memberlist")
	public void memberlist(AdminCriteria adCri, Model model) {
		
		log.info("memberList : "+adCri);
		
		model.addAttribute("memberlist", adService.getList(adCri));
		
		int total = adService.getTotal(adCri);
		
		log.info("total: "+total);
		
		model.addAttribute("pageMaker", new AdminPageDTO(adCri, total));
	}
	
	//FAQ리스트 불러오기
	@GetMapping("/admin/faqlist")
	public void faqlist(AdminCriteria adCri, Model model) {
		log.info("faqlist:"+adCri);
		
		model.addAttribute("faqlist", faqService.getList(adCri));
		
		int total = faqService.getTotal(adCri);
		
		log.info("total: "+total);
		
		model.addAttribute("pageMaker", new AdminPageDTO(adCri, total));
	}
	
	
	//FAQ 등록하기
	@GetMapping("/admin/faqregister")
	public void faqregister() {}
	
	@PostMapping("/admin/faqregister")
	public String faqregister(FaqVO faq, RedirectAttributes rttr) {
		
		log.info("register: "+faq);
		
		faqService.register(faq);
		
		rttr.addFlashAttribute("result",  faq.getFaqId());
		
		return "redirect:/admin/faqlist";
	}
	
	//FAQ 불러오기
	@GetMapping({"/admin/faqget", "/admin/faqmodify"})
	public void faqget(@RequestParam("faqId") Long faqId, @ModelAttribute("adCri")
	AdminCriteria adCri, Model model) {
		log.info("/admin/faqget or /admin/faqmodify");
		model.addAttribute("faq", faqService.get(faqId));
	}
	
	//FAQ 수정하기
	@PostMapping("/admin/faqmodify")
	public String faqmodify(FaqVO faq, @ModelAttribute("adCri") AdminCriteria adCri, RedirectAttributes rttr) {
		log.info("modify :"+faq);
		
		if(faqService.modify(faq)) {
			rttr.addFlashAttribute("result",  "success");
		}
		
		rttr.addAttribute("pageNum", adCri.getPageNum());
		rttr.addAttribute("amount", adCri.getAmount());
		return "redirect:/admin/faqlist";
	}
	
	//FAQ 삭제하기
	@PostMapping("/admin/faqremove")
	public String faqremove(@RequestParam("faqId") Long faqId, @ModelAttribute("adCri") AdminCriteria adCri, RedirectAttributes rttr) {
		log.info("remove...."+faqId);
		if(faqService.remove(faqId)) {
			rttr.addFlashAttribute("result",  "success");
		}
		rttr.addAttribute("pageNum", adCri.getPageNum());
		rttr.addAttribute("amount", adCri.getAmount());
		
		return "redirect:/admin/faqlist";
	}
}
