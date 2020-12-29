package com.sooltoryteller.controller;

import java.io.File;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sooltoryteller.domain.AdminCriteria;
import com.sooltoryteller.domain.AdminPageDTO;
import com.sooltoryteller.domain.BbstCntVO;
import com.sooltoryteller.domain.BbstCriteria;
import com.sooltoryteller.domain.BbstJoinVO;
import com.sooltoryteller.domain.BbstPageDTO;
import com.sooltoryteller.domain.BbstVO;
import com.sooltoryteller.service.BbstService;
import com.sooltoryteller.service.MemberService;
import com.sooltoryteller.utils.UploadFileUtils;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/cheers/*")
@AllArgsConstructor
public class BbstController {

	private BbstService service;
	private MemberService memberService;

	@Resource(name = "uploadPath")
	private String uploadPath;

	// 전체 게시글 조회
	@GetMapping("/list")
	public void getBbstList(HttpSession session, BbstCriteria cri, Model model) {

		String email = (String)session.getAttribute("email");
		if(email == null) {
			model.addAttribute("msg", "로그인이 필요한 페이지 입니다.");
		} else {
			log.info("BBSTLIST: " + cri);
			model.addAttribute("bbstList", service.getBbstList(cri));
			
			int total = service.getBbstTotal(cri);
			log.info("TOTAL: " + total);
			model.addAttribute("pageMaker", new BbstPageDTO(cri, total));
		}
	}

	// 게시글 등록
	@GetMapping("/register")
	public void register(HttpSession session, BbstVO bbst, Model model) {
		
		String email = (String)session.getAttribute("email");
		if(email == null) {
			model.addAttribute("msg", "로그인이 필요한 페이지 입니다.");
		}
	}

	@PostMapping("/register")
	public String register(HttpSession session, @Valid BbstJoinVO bbst, BindingResult result, Model model,
		BbstCntVO cnt, MultipartFile file, RedirectAttributes rttr) throws Exception {

		String email = (String)session.getAttribute("email");
		Long memberId = memberService.getMemberId(email);
		if(email == null) {
			model.addAttribute("msg", "로그인이 필요한 페이지 입니다.");
		} else {
			// 첨부파일 업로드 설정
			String imgUploadPath = uploadPath + File.separator + "imgUpload"; // 이미지를 업로드할 폴더를 설정 = /uploadPath/imgUpload
			String ymdPath = UploadFileUtils.calcPath(imgUploadPath); // 위의 폴더를 기준으로 연월일 폴더를 생성
			String fileName = null; // 기본 경로와 별개로 작성되는 경로 + 파일이름
			
			if(file != null) { 
				fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
				bbst.setCnImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			} else { // input box에 첨부된 파일이 없다면 = 첨부된 파일의 이름이 없다면
				fileName = bbst.getCnImg();
				bbst.setCnImg(fileName);
			}
			bbst.setCnThumbimg(
					File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
			
			bbst.setMemberId(memberId);
			
			log.info("========== REGISTER: " + bbst + " ==========");
			service.registerBbst(bbst, cnt);
			rttr.addFlashAttribute("result", bbst.getBbstId());
			
			// 에러 발생 시
			if(result.hasErrors()) {
				List<ObjectError> errorList = result.getAllErrors();
		        log.info(result.getFieldError());
		        for(ObjectError error : errorList) {
	               log.info("===== ERROR: " + error.getDefaultMessage());
	               rttr.addFlashAttribute("result", error.getDefaultMessage());
		        }
		        
				rttr.addFlashAttribute("errorMsg", "게시글 양식에 맞게 작성해주십시오.");
				return "/cheers/register";
			}
		}
		return "redirect:/cheers/list";
	}

	// 게시글 조회 및 수정
	@GetMapping({ "/get", "/modify" })
	public void get(HttpSession session, @RequestParam("bbstId") Long bbstId,
		@ModelAttribute("cri") BbstCriteria cri, Model model) {

		String email = (String)session.getAttribute("email");
		if(email == null) {
			model.addAttribute("msg", "로그인이 필요한 페이지 입니다.");
		} else {
			Long memberId = memberService.getMemberIdName(email).getMemberId();
			String name = memberService.getMemberIdName(email).getName();
			
			model.addAttribute("memberId", memberId);
			model.addAttribute("name", name);
		}
		
		log.info("/get or modify");
		model.addAttribute("bbst", service.getBbst(bbstId));
	}

	// 게시글 수정
	@PostMapping("/modify")
	public String modify(HttpSession session, @Valid BbstJoinVO bbst, BindingResult result, Model model, MultipartFile file,
		@ModelAttribute("cri") BbstCriteria cri, RedirectAttributes rttr) throws Exception {

		String email = (String)session.getAttribute("email");
		Long memberId = memberService.getMemberId(email);
		bbst.setMemberId(memberId);
		
		// 첨부파일 업로드 설정
		String imgUploadPath = uploadPath + File.separator + "imgUpload"; // 이미지를 업로드할 폴더를 설정 = /uploadPath/imgUpload
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath); // 위의 폴더를 기준으로 연월일 폴더를 생성
		String fileName = null; // 기본 경로와 별개로 작성되는 경로 + 파일이름

		if (file != null) { // input box에 첨부된 파일이 없다면 = 첨부된 파일의 이름이 없다면
			fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
			bbst.setCnImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		} else {
			fileName = bbst.getCnImg();
			bbst.setCnImg(fileName);
		}

		bbst.setCnThumbimg(
			File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		log.info(bbst.getCnImg() + bbst.getCnThumbimg());

		log.info("========== MODIFY: " + bbst + " ==========");
		if (service.modifyBbst(bbst)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		// 에러 발생 시
		if(result.hasErrors()) {
			List<ObjectError> errorList = result.getAllErrors();
	        log.info(result.getFieldError());
	        for(ObjectError error : errorList) {
               log.info("===== ERROR: " + error.getDefaultMessage());
               rttr.addFlashAttribute("result", error.getDefaultMessage());
	        }
	        
	        rttr.addFlashAttribute("errorMsg", "게시글 양식에 맞게 작성해주십시오.");
			model.addAttribute("bbst", bbst);
			return "/cheers/modify";
		}

		return "redirect:/cheers/get" + cri.getBbstListLink() + "&bbstId=" + bbst.getBbstId();
	}

	// 게시글 삭제
	@PostMapping("/remove")
	public String remove(HttpSession session, BbstJoinVO bbst, @RequestParam("bbstId") Long bbstId, 
		@ModelAttribute("cri") BbstCriteria cri, RedirectAttributes rttr) {

		String email = (String)session.getAttribute("email");
		Long memberId = memberService.getMemberId(email);
		bbst.setMemberId(memberId);
		
		log.info("========== REMOVE BBSTID " + bbstId + " ==========");

		if (service.removeBbst(bbstId)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/cheers/list" + cri.getBbstListLink();
	}
}