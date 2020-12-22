package com.sooltoryteller.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sooltoryteller.domain.AdminCriteria;
import com.sooltoryteller.domain.AdminPageDTO;
import com.sooltoryteller.domain.EmailVO;
import com.sooltoryteller.domain.FaqVO;
import com.sooltoryteller.domain.InquiryAnswerVO;
import com.sooltoryteller.domain.LiqCnVO;
import com.sooltoryteller.domain.LiqCoVO;
import com.sooltoryteller.domain.LiqVO;
import com.sooltoryteller.service.AdminService;
import com.sooltoryteller.service.FaqService;
import com.sooltoryteller.service.InquiryAnswerService;
import com.sooltoryteller.service.InquiryService;
import com.sooltoryteller.service.LiqCoService;
import com.sooltoryteller.service.LiqService;
import com.sooltoryteller.service.MailService;
import com.sooltoryteller.service.MemberService;
import com.sooltoryteller.utils.UploadFileUtils;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/admin/*")
public class AdminController {
	@Resource(name = "uploadPath")
	private String uploadPath;
	private AdminService adService;
	private FaqService faqService;
	private LiqService liqService;
	private LiqCoService liqCoService;
	private InquiryAnswerService inqAnService;
	private InquiryService inqService;
	private MemberService memberService;
	private MailService mailService;
	private EmailVO e_mail;

	// 전통주 리스트페이지
	@GetMapping("/liq-list")
	public void liq(Model model, AdminCriteria adCri, HttpSession session) {
		
		String authority = (String) session.getAttribute("authority");
		
		if (authority == null || !authority.equalsIgnoreCase("admin")) {
			model.addAttribute("msg", "권한이 필요한 페이지 입니다.");
			return;
			
		}else if(authority.equalsIgnoreCase("admin")) {
			
			log.info("liq list");
			model.addAttribute("liq", liqService.getLiqListWithPaging(adCri));
			int total = liqService.liqCnt();
			model.addAttribute("pageMaker", new AdminPageDTO(adCri, total));

		}
	}

	// 전통주 관리페이지
	@GetMapping("/get-liq")
	public void getLiq(Model model, Long liqId, HttpSession session) {

		String authority = (String) session.getAttribute("authority");
		
		if (authority == null || !authority.equalsIgnoreCase("admin")) {
			model.addAttribute("msg", "권한이 필요한 페이지 입니다.");
			return;
			
		}else if(authority.equalsIgnoreCase("admin")) {
			log.info("liq" + liqId);
			model.addAttribute("liq", liqService.get(liqId));
		}
	}

	// 전통주 등록 페이지
	@GetMapping("/liq-register")
	public void liqRegister(Model model, HttpSession session) {
		
		String authority = (String) session.getAttribute("authority");
		
		if (authority == null || !authority.equalsIgnoreCase("admin")) {
			model.addAttribute("msg", "권한이 필요한 페이지 입니다.");
			return;
		}
		
	}
	// 전통주 등록
	@PostMapping("/liq-register")
	public String liqRegister(@Valid LiqVO liq, BindingResult result, String liqCoNm,  Model model,  RedirectAttributes rttr, MultipartFile file) throws IOException, Exception {
		
		log.info("liq register"+liq);
		
		//양조장이름으로 존재하는 양조장인지 liqCoId체크
		Long liqCoId = liqCoService.checkExistLiqCo(liqCoNm);
		int liqExist = liqService.getliqExist(liq.getNm());
		// 첨부파일 업로드 설정
		String imgUploadPath = uploadPath + File.separator + "imgUpload"; // 이미지를 업로드할 폴더를 설정 = /uploadPath/imgUpload
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath); // 위의 폴더를 기준으로 연월일 폴더를 생성
		String fileName = null; // 기본 경로와 별개로 작성되는 경로 + 파일이름
		
		if(file != null) { 
			fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
			
		} else { // input box에 첨부된 파일이 없다면 = 첨부된 파일의 이름이 없다면
			fileName = liq.getLiqImg();
			liq.setLiqImg(fileName);
		}
		liq.setLiqImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		liq.setLiqThumb(
				File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		log.info("============================");
		if(result.hasErrors()) { 
			List<ObjectError> errorList = result.getAllErrors();
			log.info(result.getFieldError());
	        for (ObjectError error : errorList) {
	            log.info("=====error: " + error.getDefaultMessage());
	            rttr.addFlashAttribute("result", error.getDefaultMessage());
	        }
				return "redirect:/admin/liq-register"; 
		}
		
		if (liqCoId != null) {
			if(liqExist != 1) {
			if (liqService.registerLiq(liq, liqCoId)) {
				rttr.addAttribute("result", "success");
				log.info("성공");
			} else {
				rttr.addAttribute("result", "등록에 실패 하였습니다");
				log.info("실패");
			}
			return "redirect:/admin/liq-list";
			
			}else {
				rttr.addFlashAttribute("liqError", "이미 존재하는 전통주입니다.");
				return "redirect:/admin/liq-register";
			}
			
			
		}else {
			rttr.addFlashAttribute("error", "존재하지않는 양조장입니다.");
			return "redirect:/admin/liq-register";
		}
	}
	// 전통주 삭제
	@PostMapping("/remove-liq")
	public String removeLiq(Long liqId, RedirectAttributes rttr) {
		log.info("remove "+liqId);
		liqService.removeLiq(liqId);
		return "redirect:/admin/liq-list";
	}
	
	// 전통주 수정
	@PostMapping("/modify-liq")
	public String modifyLiq(LiqVO liq, LiqCnVO cn, RedirectAttributes rttr) {
		liqService.modify(liq, cn);
		
		return "redirect:/admin/";
	}

	// 양조장 리스트페이지
	@GetMapping("/liq-co-list")
	public void liqCo(Model model, AdminCriteria adCri, HttpSession session) {

		String authority = (String) session.getAttribute("authority");
		
		if (authority == null || !authority.equalsIgnoreCase("admin")) {
			model.addAttribute("msg", "권한이 필요한 페이지 입니다.");
			return;
			
		}else if(authority.equalsIgnoreCase("admin")) {
		
			log.info("liq co list");
			model.addAttribute("liqCo", liqCoService.getLiqCoListWithPaging(adCri));
			int total = liqCoService.liqCoCnt();
			
			model.addAttribute("pageMaker", new AdminPageDTO(adCri, total));

		}
	}
	// 양조장 관리페이지
	@GetMapping("/get-liq-co")
	public void getLiqCo(Model model, Long liqCoId, HttpSession session) {

		String authority = (String) session.getAttribute("authority");
		
		if (authority == null || !authority.equalsIgnoreCase("admin")) {
			model.addAttribute("msg", "권한이 필요한 페이지 입니다.");
			return;
			
		}else if(authority.equalsIgnoreCase("admin")) {
			log.info("liq co" + liqCoId);
			model.addAttribute("liqCo", liqCoService.getLiqCoById(liqCoId));
		}
	}

	// 양조장 등록페이지
	@GetMapping("/liq-co-register")
	public void liqCoRegister(Model model, HttpSession session) {
		
		String authority = (String) session.getAttribute("authority");
		
		if (authority == null || !authority.equalsIgnoreCase("admin")) {
			model.addAttribute("msg", "권한이 필요한 페이지 입니다.");
			return;
		}
			
	}

	// 양조장 등록
	@PostMapping("/liq-co-register")
	public String liqCoRegister(@Valid LiqCoVO vo, BindingResult result,RedirectAttributes rttr) {
		
		if(result.hasErrors()) { 
			List<ObjectError> errorList = result.getAllErrors();
			
			log.info(result.getFieldError());
	        for (ObjectError error : errorList) 
	        	log.info(error);
	        	rttr.addFlashAttribute("result", "양식에 맞게 작성해주세요.");
	        
				return "redirect:/admin/liq-co-register"; 
		}
		
		Long liqCoId = liqCoService.checkExistLiqCo(vo.getNm());
		
		if(liqCoId != null) {
			rttr.addFlashAttribute("error", "이미 존재하는 양조장입니다.");
			return "redirect:/admin/liq-co-register";
		}
		
		log.info("result : " + liqCoService.registerLiqCo(vo));
		return "redirect:/admin/liq-co-list";
	}

	//관리자-회원리스트페이지
	@GetMapping("/memberlist")
	public void memberlist(AdminCriteria adCri, Model model, HttpSession session) {

		String authority = (String) session.getAttribute("authority");
		
		if (authority == null || !authority.equalsIgnoreCase("admin")) {
			model.addAttribute("msg", "권한이 필요한 페이지 입니다.");
			return;
			
		}else if(authority.equalsIgnoreCase("admin")) {
		
			log.info("memberList : " + adCri);
	
			model.addAttribute("memberlist", adService.getList(adCri));
	
			int total = adService.getTotal(adCri);
	
			log.info("total: " + total);
	
			model.addAttribute("pageMaker", new AdminPageDTO(adCri, total));
			
			
		}
	}
	
	//회원탈퇴
	@GetMapping("/withdraw")
	public String withdraw(@RequestParam("memberId") Long memberId, @ModelAttribute("adCri") AdminCriteria adCri,
			Model model, HttpSession session, RedirectAttributes rttr) {
			
		log.info("member withdraw");
			
		String authority = (String) session.getAttribute("authority");
			
		if (authority == null || !authority.equalsIgnoreCase("admin")) {
			model.addAttribute("msg", "권한이 필요한 페이지 입니다.");
			return "/";
				
		}else if(authority.equalsIgnoreCase("admin")) {
			String email = memberService.getEmail(memberId);
			
			memberService.modifyRegStus(email);
				
			
		}
		return "redirect:/admin/memberlist";
	}

	// FAQ리스트 불러오기
	@GetMapping("/faqlist")
	public void faqlist(AdminCriteria adCri, Model model, HttpSession session) {
		log.info("faqlist:" + adCri);
		
		String authority = (String) session.getAttribute("authority");
		
		if (authority == null || !authority.equalsIgnoreCase("admin")) {
			model.addAttribute("msg", "권한이 필요한 페이지 입니다.");
			return;
			
		}else if(authority.equalsIgnoreCase("admin")) {

			model.addAttribute("faqlist", faqService.getList(adCri));
	
			int total = faqService.getTotal(adCri);
	
			log.info("total: " + total);
	
			model.addAttribute("pageMaker", new AdminPageDTO(adCri, total));
		
		}
	}

	// FAQ 등록하기
	@GetMapping("/faqregister")
	public void faqregister(Model model, HttpSession session) {
		
		String authority = (String) session.getAttribute("authority");
		
		if (authority == null || !authority.equalsIgnoreCase("admin")) {
			model.addAttribute("msg", "권한이 필요한 페이지 입니다.");
			return;
		}
	}

	@PostMapping("/faqregister")
	public String faqregister(@Valid FaqVO faq, BindingResult result, Model model, RedirectAttributes rttr) {

		log.info("register: " + faq);

		//에러발생시
		if(result.hasErrors()) {
			model.addAttribute("faq", faq);
			model.addAttribute("errorMsg",  "입력형식이 잘 못 되었습니다.");
			
		}
		
		faqService.register(faq);

		rttr.addFlashAttribute("result", faq.getFaqId());

		return "redirect:/admin/faqlist";
	}

	// FAQ 불러오기
	@GetMapping({ "/faqget", "/faqmodify" })
	public void faqget(@RequestParam("faqId") Long faqId, 
			@ModelAttribute("adCri") AdminCriteria adCri, Model model, HttpSession session) {
		
		log.info("/faqget or /faqmodify");
		
		String authority = (String) session.getAttribute("authority");
		
		if (authority == null || !authority.equalsIgnoreCase("admin")) {
			model.addAttribute("msg", "권한이 필요한 페이지 입니다.");
			return;
			
		}else if(authority.equalsIgnoreCase("admin")) {
		
		model.addAttribute("faq", faqService.get(faqId));
		
		}
	}

	// FAQ 수정하기
	@PostMapping("/faqmodify")
	public String faqmodify(@Valid FaqVO faq, BindingResult result, @ModelAttribute("adCri") AdminCriteria adCri,
			Model model, RedirectAttributes rttr) {
		log.info("modify :"+faq);

		//에러발생시
		if(result.hasErrors()) {
			model.addAttribute("errorMsg",  "입력형식이 잘 못 되었습니다.");
			return "/admin/faqmodify";
		}
		
		
		if(faqService.modify(faq)) {
			rttr.addFlashAttribute("result",  "success");
		}

		rttr.addAttribute("pageNum", adCri.getPageNum());
		rttr.addAttribute("amount", adCri.getAmount());
		rttr.addAttribute("keyword", adCri.getKeyword());
		
		return "redirect:/admin/faqlist";
	}

	// FAQ 삭제하기
	@PostMapping("/faqremove")
	public String faqremove(@RequestParam("faqId") Long faqId, AdminCriteria adCri, RedirectAttributes rttr) {
		log.info("remove...."+faqId);
		if(faqService.remove(faqId)) {
			rttr.addFlashAttribute("result",  "success");
		}
		rttr.addAttribute("pageNum", adCri.getPageNum());
		rttr.addAttribute("amount", adCri.getAmount());
		rttr.addAttribute("keyword", adCri.getKeyword());

		return "redirect:/admin/faqlist";
	}
	
	//1:1문의 리스트
	@GetMapping("/inquirylist")
	public void inquirylist(AdminCriteria adCri, Model model, HttpSession session) {
	
		String authority = (String) session.getAttribute("authority");
		
		if (authority == null || !authority.equalsIgnoreCase("admin")) {
			model.addAttribute("msg", "권한이 필요한 페이지 입니다.");
			return;
			
		}else if(authority.equalsIgnoreCase("admin")) {
			
			log.info("list" + adCri);
			model.addAttribute("inquirylist", inqService.getList(adCri));
			
			int total = inqService.getTotal(adCri);
			
			log.info("total : "+total);
			
			model.addAttribute("pageMaker", new AdminPageDTO(adCri, total));
			System.out.println(model);
		}
	}
	
	//1:1문의 조회
	@GetMapping("/getinquiry")
	public void getinquiry(@RequestParam("inquiryId")Long inquiryId, 
			@ModelAttribute("adCri")AdminCriteria adCri, Model model, HttpSession session) {
		
		log.info("/getinquiry" + inquiryId);
		
		String authority = (String) session.getAttribute("authority");
		
		if (authority == null || !authority.equalsIgnoreCase("admin")) {
			model.addAttribute("msg", "권한이 필요한 페이지 입니다.");
			return;
			
		}else if(authority.equalsIgnoreCase("admin")) {
			model.addAttribute("inq", inqService.get(inquiryId));
			log.info("inq : "+model);
		}
	}
	
	
	//문의 답변
	@GetMapping("/answer")
	public void answer(@RequestParam("inquiryId")Long inquiryId, Model model, HttpSession session) {
		
		log.info("문의글 번호: "+inquiryId);
		
		String authority = (String) session.getAttribute("authority");
		
		if (authority == null || !authority.equalsIgnoreCase("admin")) {
			model.addAttribute("msg", "권한이 필요한 페이지 입니다.");
			return;
			
		}else if(authority.equalsIgnoreCase("admin")) {
		
			model.addAttribute("inquiryId", inquiryId);
		}
	}
	
	//답변 등록 및 이메일전송
	@PostMapping("/answer")
	public String answer(@Valid InquiryAnswerVO inqAn, BindingResult result,
			@ModelAttribute("adCri") AdminCriteria adCri, Model model, RedirectAttributes rttr) {
		
		log.info("answer register...."+inqAn);
		
		//에러발생시
		if(result.hasErrors()) {
			model.addAttribute("errorMsg",  "입력형식이 잘 못 되었습니다.");
			return "/admin/answer";
		}
		
		
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
		rttr.addAttribute("pageNum",  adCri.getPageNum());
		rttr.addAttribute("amount",  adCri.getAmount());
		rttr.addFlashAttribute("result", false);
		return "redirect:/admin/inquirylist";
	}
	
	//답변조회
	@GetMapping("/getanswer")
	public void getanswer(@RequestParam("inquiryId")Long inquiryId, 
			Model model, HttpSession session) {
		log.info("문의글 번호: "+inquiryId);
		
		String authority = (String) session.getAttribute("authority");

		if (authority == null || !authority.equalsIgnoreCase("admin")) {
			model.addAttribute("msg", "권한이 필요한 페이지 입니다.");
			return;
			
		}else if(authority.equalsIgnoreCase("admin")) {
			model.addAttribute("answer", inqAnService.get(inquiryId));
		}
	}
}
