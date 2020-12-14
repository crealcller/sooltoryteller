package com.sooltoryteller.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sooltoryteller.domain.LiqCoVO;
import com.sooltoryteller.service.LiqService;
import com.sooltoryteller.service.MailService;
import com.sooltoryteller.service.MemberService;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sooltoryteller.domain.AdminCriteria;
import com.sooltoryteller.domain.AdminPageDTO;
import com.sooltoryteller.domain.EmailVO;
import com.sooltoryteller.domain.FaqVO;
import com.sooltoryteller.domain.InquiryAnswerVO;
import com.sooltoryteller.domain.InquiryVO;
import com.sooltoryteller.service.AdminService;
import com.sooltoryteller.service.FaqService;
import com.sooltoryteller.service.InquiryAnswerService;
import com.sooltoryteller.service.InquiryService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/admin/*")
public class AdminController {

	private AdminService adService;
	private FaqService faqService;
	private LiqService liqService;
	private InquiryAnswerService inqAnService;
	private InquiryService inqService;
	private MemberService memberService;
	private MailService mailService;
	private EmailVO e_mail;

	@GetMapping("/liq-register")
	public void liq() {
	}


	@GetMapping("/liq-co-register")
	public void liqCo() {
	}

	@PostMapping("/liq-co-register")
	public String liqCoRegister(LiqCoVO vo) {
		log.info("result : "+liqService.registerLiqCo(vo));
		return "redirect:/admin/complete";
	}

	//관리자 메인 페이지
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String admin() {
		return "admin";
	}

	//관리자-회원리스트페이지
	@GetMapping("/memberlist")
	public void memberlist(AdminCriteria adCri, Model model) {

		log.info("memberList : "+adCri);

		model.addAttribute("memberlist", adService.getList(adCri));

		int total = adService.getTotal(adCri);

		log.info("total: "+total);

		model.addAttribute("pageMaker", new AdminPageDTO(adCri, total));
	}

	//FAQ리스트 불러오기
	@GetMapping("/faqlist")
	public void faqlist(AdminCriteria adCri, Model model) {
		log.info("faqlist:"+adCri);

		model.addAttribute("faqlist", faqService.getList(adCri));

		int total = faqService.getTotal(adCri);

		log.info("total: "+total);

		model.addAttribute("pageMaker", new AdminPageDTO(adCri, total));
	}


	//FAQ 등록하기
	@GetMapping("/faqregister")
	public void faqregister() {}

	@PostMapping("/faqregister")
	public String faqregister(FaqVO faq, RedirectAttributes rttr) {

		log.info("register: "+faq);

		faqService.register(faq);

		rttr.addFlashAttribute("result",  faq.getFaqId());

		return "redirect:/admin/faqlist";
	}

	//FAQ 불러오기
	@GetMapping({"/faqget", "/faqmodify"})
	public void faqget(@RequestParam("faqId") Long faqId, @ModelAttribute("adCri")
	AdminCriteria adCri, Model model) {
		log.info("/faqget or /faqmodify");
		model.addAttribute("faq", faqService.get(faqId));
	}

	//FAQ 수정하기
	@PostMapping("/faqmodify")
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
	@PostMapping("/faqremove")
	public String faqremove(@RequestParam("faqId") Long faqId, @ModelAttribute("adCri") AdminCriteria adCri, RedirectAttributes rttr) {
		log.info("remove...."+faqId);
		if(faqService.remove(faqId)) {
			rttr.addFlashAttribute("result",  "success");
		}
		rttr.addAttribute("pageNum", adCri.getPageNum());
		rttr.addAttribute("amount", adCri.getAmount());

		return "redirect:/admin/faqlist";
	}
	
	//1:1문의 리스트
	@GetMapping("/inquirylist")
	public void inquirylist(Model model) {
	
		log.info("list");
		model.addAttribute("inquirylist", inqService.getList());
		System.out.println(model);
	}
	
	//1:1문의 조회
	@GetMapping("/getinquiry")
	public void getinquiry(@RequestParam("inquiryId")Long inquiryId, Model model) {
		
		log.info("/getinquiry" + inquiryId);
		model.addAttribute("inq", inqService.get(inquiryId));
		log.info("inq : "+model);
	}
	
	
	//문의 답변
	@GetMapping("/answer")
	public void answer(@RequestParam("inquiryId")Long inquiryId, Model model) {
		log.info("문의글 번호: "+inquiryId);
		
		model.addAttribute("inquiryId", inquiryId);
	}
	
	//답변 등록 및 이메일전송
	@PostMapping("/answer")
	public String answer(InquiryAnswerVO inqAn, RedirectAttributes rttr) {
		
		log.info("answer register...."+inqAn);
		
		//답변등록이 되었다면 이메일전송
		if(inqAnService.register(inqAn, "IC")) {
			
			Long memberId = inqService.getMemberId(inqAn.getInquiryId());
			String email = memberService.getEmail(memberId);
			
			System.out.println("memberId : "+memberId +", memberEmail : "+email);
			
			e_mail.setTitle("sooltoryteller 1:1 문의에 대한 답변드립니다.");
            e_mail.setContent(
            		//줄바꿈
            		System.getProperty("line.separator") +
            		"안녕하세요 sooltoryteller 입니다." +
            		System.getProperty("line.separator")+
            		"고객님의 주신 문의에 대하여 답변 보내드립니다."+
            		System.getProperty("line.separator")+
            		inqAn.getCn()
            		);
        	
            e_mail.setTo(email);
            mailService.send(e_mail);
			rttr.addFlashAttribute("result", true);
		}
		rttr.addFlashAttribute("result", false);
		return "redirect:/admin/inquirylist";
	}
	
	//답변조회
	@GetMapping("/getanswer")
	public void getanswer(@RequestParam("inquiryId")Long inquiryId, Model model) {
		log.info("문의글 번호: "+inquiryId);
		
		model.addAttribute("answer", inqAnService.get(inquiryId));
	}
}
