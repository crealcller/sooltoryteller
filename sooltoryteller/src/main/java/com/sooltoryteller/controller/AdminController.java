package com.sooltoryteller.controller;

import java.io.File;
import java.io.IOException;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sooltoryteller.domain.AdminCriteria;
import com.sooltoryteller.domain.AdminPageDTO;
import com.sooltoryteller.domain.FaqVO;
import com.sooltoryteller.domain.LiqCnVO;
import com.sooltoryteller.domain.LiqCoVO;
import com.sooltoryteller.domain.LiqCntVO;
import com.sooltoryteller.domain.LiqVO;
import com.sooltoryteller.service.AdminService;
import com.sooltoryteller.service.FaqService;
import com.sooltoryteller.service.LiqCoService;
import com.sooltoryteller.service.LiqService;
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

	// 전통주 리스트페이지
	@GetMapping("/liq-list")
	public void liq(Model model, AdminCriteria adCri) {
		log.info("liq list");
		model.addAttribute("liq", liqService.getLiqListWithPaging(adCri));
		int total = liqService.liqCnt();
		model.addAttribute("pageMaker", new AdminPageDTO(adCri, total));
	}

	// 전통주 관리페이지
	@GetMapping("/get-liq")
	public void getLiq(Model model, Long liqId) {
		log.info("liq" + liqId);
		model.addAttribute("liq", liqService.get(liqId));
	}

	// 전통주 등록 페이지
	@GetMapping("/liq-register")
	public void liqRegister() {
	}

	// 전통주 등록
	@PostMapping("/liq-register")
	public String liqRegister(LiqVO liq, LiqCnVO cn, String liqCoNm, LiqCntVO cnt, RedirectAttributes rttr,MultipartFile file) throws IOException, Exception {
		log.info("liq register");
		Long liqCoId = liqCoService.checkExistLiqCo(liqCoNm);
		
		
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
		if (liqCoId != null) {
			

			if (liqService.registerLiq(liq, cn, liqCoId, cnt)) {

				rttr.addAttribute("result", "success");
				log.info("성공");
				
			} else {
				rttr.addAttribute("result", "등록에 실패 하였습니다");
				log.info("실패");
			}
		}
		return "redirect:/admin/";
	}

	// 전통주 삭제
	@PostMapping("/admin/remove-liq")
	public String removeLiq(Long liqId, RedirectAttributes rttr) {
		log.info("remove "+liqId);
		liqService.removeLiq(liqId);
		return "redirect:/admin/";
	}
	
	// 전통주 수정
	@PostMapping("/admin/modify-liq")
	public String modifyLiq(LiqVO liq, LiqCnVO cn, RedirectAttributes rttr) {
		liqService.modify(liq, cn);
		
		return "redirect:/admin/";
	}

	// 양조장 리스트페이지
	@GetMapping("/liq-co-list")
	public void liqCo(Model model, AdminCriteria adCri) {
		log.info("liq co list");
		model.addAttribute("liqCo", liqCoService.getLiqCoListWithPaging(adCri));
		int total = liqCoService.liqCoCnt();
		
		model.addAttribute("pageMaker", new AdminPageDTO(adCri, total));
	}

	// 양조장 관리페이지
	@GetMapping("/get-liq-co")
	public void getLiqCo(Model model, Long liqCoId) {
		log.info("liq co" + liqCoId);
		model.addAttribute("liqCo", liqCoService.getLiqCoById(liqCoId));
	}

	// 양조장 등록페이지
	@GetMapping("/liq-co-register")
	public void liqCoRegister() {
	}

	// 양조장 등록
	@PostMapping("/liq-co-register")
	public String liqCoRegister(LiqCoVO vo) {
		log.info("result : " + liqCoService.registerLiqCo(vo));
		return "redirect:/admin/";
	}

	// 관리자 메인 페이지
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String admin() {
		return "admin";
	}

	// 관리자-회원리스트페이지
	@GetMapping("/memberlist")
	public void memberlist(AdminCriteria adCri, Model model) {

		log.info("memberList : " + adCri);

		model.addAttribute("memberlist", adService.getList(adCri));

		int total = adService.getTotal(adCri);

		log.info("total: " + total);

		model.addAttribute("pageMaker", new AdminPageDTO(adCri, total));
	}

	// FAQ리스트 불러오기
	@GetMapping("/faqlist")
	public void faqlist(AdminCriteria adCri, Model model) {
		log.info("faqlist:" + adCri);

		model.addAttribute("faqlist", faqService.getList(adCri));

		int total = faqService.getTotal(adCri);

		log.info("total: " + total);

		model.addAttribute("pageMaker", new AdminPageDTO(adCri, total));
	}

	// FAQ 등록하기
	@GetMapping("/faqregister")
	public void faqregister() {
	}

	@PostMapping("/faqregister")
	public String faqregister(FaqVO faq, RedirectAttributes rttr) {

		log.info("register: " + faq);

		faqService.register(faq);

		rttr.addFlashAttribute("result", faq.getFaqId());

		return "redirect:/admin/faqlist";
	}

	// FAQ 불러오기
	@GetMapping({ "/faqget", "/faqmodify" })
	public void faqget(@RequestParam("faqId") Long faqId, @ModelAttribute("adCri") AdminCriteria adCri, Model model) {
		log.info("/faqget or /faqmodify");
		model.addAttribute("faq", faqService.get(faqId));
	}

	// FAQ 수정하기
	@PostMapping("/faqmodify")
	public String faqmodify(FaqVO faq, @ModelAttribute("adCri") AdminCriteria adCri, RedirectAttributes rttr) {
		log.info("modify :" + faq);

		if (faqService.modify(faq)) {
			rttr.addFlashAttribute("result", "success");
		}

		rttr.addAttribute("pageNum", adCri.getPageNum());
		rttr.addAttribute("amount", adCri.getAmount());
		return "redirect:/admin/faqlist";
	}

	// FAQ 삭제하기
	@PostMapping("/faqremove")
	public String faqremove(@RequestParam("faqId") Long faqId, @ModelAttribute("adCri") AdminCriteria adCri,
			RedirectAttributes rttr) {
		log.info("remove...." + faqId);
		if (faqService.remove(faqId)) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", adCri.getPageNum());
		rttr.addAttribute("amount", adCri.getAmount());

		return "redirect:/admin/faqlist";
	}
}
