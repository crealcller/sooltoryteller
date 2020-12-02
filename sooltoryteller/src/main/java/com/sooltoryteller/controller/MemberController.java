package com.sooltoryteller.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sooltoryteller.domain.MemberVO;
import com.sooltoryteller.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class MemberController {

	private MemberService service;

	@GetMapping("/login")
	public void login() {
	}

	// 로그인action 로그인이 메인페이지의 모달창으로 있으므로 메인페이지와 매핑해줌
	@PostMapping("/login")
	public String login(String email, String pwd, HttpServletRequest request, HttpServletResponse response,
			RedirectAttributes rttr) {

		// id저장 체크박스
		String save = request.getParameter("save");

		HttpSession session = request.getSession();

		Cookie cookie = new Cookie("email", email);

		// 입력받은 이메일, 비밀번호 정보가 db상의 정보와 일치하는 것이 있는지 조회
		if (service.loginCheck(email, pwd)) {
			session.setAttribute("email", email);

			// id저장 체크박스가 체크되어 있다면 쿠키 저장
			if (save != null) {
				response.addCookie(cookie);
				// id저장 체크박스의 체크가 풀려있다면 쿠키 삭제
			} else {
				cookie.setMaxAge(0); // 쿠키의 유효시간을 0으로 변경(쿠키삭제)
				response.addCookie(cookie); // 쿠키를 응답에 포함시킨다.
			}
		} else {
			String msg = "입력하신 이메일 또는 비밀번호가 일치하지 않습니다.";
			rttr.addFlashAttribute("msg", msg);
			return "redirect:/login";
		}
		return "redirect:/";
	}

	// 로그아웃
	@GetMapping("/logout")
	public String logout(HttpServletRequest request, RedirectAttributes rttr) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/";
	}

	// 회원가입
	@GetMapping("/join")
	public void join() {
	}

	// 회원가입 아이디 중복체크(보류)
//		@RequestMapping(value = "/overlapCheck", method = RequestMethod.POST)
//		@ResponseBody
//		public  int overlapCheck(String email ) {
//			System.out.println("email:"+email);
//			int cnt = service.checkEmail(email);
//			System.out.println(cnt);
//			return cnt;
//			
//		}

	// 마이페이지
	@GetMapping("/mypage")
	public void mypage(HttpSession session, Model model) {
		String email = (String) session.getAttribute("email");

		if (email == null) {
			model.addAttribute("msg", "로그인이 필요한 페이지 입니다.");
		}
	}
	
	
	// 회원정보 수정 보여줌
	@GetMapping("/mypage/changeuserinfo")
	public void changeuserinfo(HttpSession session, Model model) {
		// 로그인 성공 후 세션에 저장된 email 정보를 꺼내와서 member 정보를 불러옴
		String email = (String) session.getAttribute("email");

		if (email == null) {
			model.addAttribute("msg", "로그인이 필요한 페이지 입니다.");

		} else {
			model.addAttribute("member", service.get(email));

		}
	}

	// 회원정보수정
	@PostMapping("/mypage/changeuserinfo")
	public void changeuserinfo(MemberVO member, Model model) {
		log.info("changeUserInfo: " + member);
		// 닉네임,  전화번호, 프로필사진만 변경
		if(service.modify(member)) {
			model.addAttribute("success", "회원 정보가 수정되었습니다.");
		}

		model.addAttribute("member", service.get(member.getEmail()));
	}
	
	//회원탈퇴
	@GetMapping("/withdrawal")
	public String withdrawal(HttpSession session, RedirectAttributes rttr) {
		
		String email = (String) session.getAttribute("email");
		
		//회원탈퇴가 성공하면 메인으로
		if(service.modifyRegStus(email)) {
			session.invalidate();
			return "redirect:/";
		}

		return "redirect:/mypage/changeuserinfo";
		
	}
	
	@GetMapping("/mypage/changepwd")
	public void changepwd(HttpSession session, Model model) {
		String email = (String) session.getAttribute("email");

		if (email == null) {
			model.addAttribute("msg", "로그인이 필요한 페이지 입니다.");
		}
	}
	
	@PostMapping("/mypage/changepwd")
	public void changepwd(String pwd, String newpwd, HttpSession session, Model model) {

		String email = (String) session.getAttribute("email");
		
		//회원의 현재 비밀번호 불러오기
		String tmp = service.getPwd(email);
		
		if(tmp.equals(pwd)) {
			service.modifyPwd(email, newpwd);
			model.addAttribute("success",  "비밀번호 변경이 완료되었습니다.");
		}else {
			model.addAttribute("success",  "비밀번호 변경이 실패했습니다.");
		}
	}

}
