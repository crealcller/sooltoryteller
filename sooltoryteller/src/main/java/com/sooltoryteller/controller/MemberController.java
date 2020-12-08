package com.sooltoryteller.controller;
import java.util.UUID;

import javax.crypto.Mac;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.fasterxml.jackson.databind.JsonNode;
import com.sooltoryteller.domain.EmailVO;
import com.sooltoryteller.domain.MemberVO;
import com.sooltoryteller.service.MailService;
import com.sooltoryteller.service.MemberFavDrkService;
import com.sooltoryteller.service.MemberService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class MemberController {
	private MailService mailService;
	private EmailVO e_mail;
	private MemberService service;
	private MemberFavDrkService favDrkService;
	private KakaoLoginController kakaoController;
	
	//로그인 view
	@GetMapping("/login")
	public ModelAndView login(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		String kakaoUrl = kakaoController.getAuthorizationUrl(session);
		
		mav.setViewName("login");
		mav.addObject("kakaoUrl", kakaoUrl);
		
		return mav;
	}
	
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
	public String logout(HttpServletRequest request, HttpServletResponse response, RedirectAttributes rttr ) {
		
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/";
	}
	
	// 회원가입 view
	@GetMapping("/join")
	public void join() {	}
	
	//sns회원가입 view
	@GetMapping("/snsJoin")
	public void snsJoin() {}
	
	
	// 회원가입 아이디 중복체크
		@RequestMapping(value = "/idOverlapCheck", method = RequestMethod.POST)
		@ResponseBody
		public  int idOverlapCheck(String email ) {
			int cnt = service.checkEmail(email);
			return cnt;
			
		}
		
	//회원가입 닉네임 중복체크
		@RequestMapping(value = "/nOverlapCheck", method = RequestMethod.POST)
		@ResponseBody
		public  int nOverlapCheck(String name) {
			int cnt = service.checkName(name);
			return cnt;
			
		}
		
		
	//회원가입
	@PostMapping("/join")
	public String join(@Valid MemberVO member, BindingResult result, HttpServletRequest request,
			HttpServletResponse response, Model model, RedirectAttributes rttr) {
		
		//에러발생시
		if( result.hasErrors()) {
			model.addAttribute("member", member);
			model.addAttribute("msg", "회원가입 실패");
			return "/join";
		}
		//선호하는 술 체크 배열로 받아오기
		String[] arr = request.getParameterValues("drink");
		
			//회원가입이 성공했다면
		if(service.join(member)) {
			//회원아이디를 가져와서 선호하는 술 등록
			Long memberId = service.getMemberId(member.getEmail());
			favDrkService.registerFavDrk(memberId, arr);
			
			//세션에 회원 닉네임, 이메일 저장 ->로그인상태로
			HttpSession session = request.getSession();
			session.setAttribute("name", member.getName());
			session.setAttribute("email", member.getEmail());
			return "redirect:/userInfo";
		}
		
		return "/join";
		
	}
	
	//sns회원가입
	@PostMapping("/snsJoin")
	public String snsJoin(MemberVO member, HttpServletRequest request,
	HttpServletResponse response, Model model, RedirectAttributes rttr) {
		
		
				//선호하는 술 체크 배열로 받아오기
				String[] arr = request.getParameterValues("drink");
				
				//비밀번호가 없으므로 임시비밀번호 생성후 넣어줌
				String tmpPwd = UUID.randomUUID().toString().replace("-", "");
				tmpPwd = tmpPwd.substring(0,9);
				
				member.setPwd(tmpPwd);
				
				//회원가입이 성공했다면
				if(service.join(member)) {
					//회원아이디를 가져와서 선호하는 술 등록
					Long memberId = service.getMemberId(member.getEmail());
					favDrkService.registerFavDrk(memberId, arr);
					
					//세션에 회원 닉네임, 이메일 저장 ->로그인상태로
					HttpSession session = request.getSession();
					session.setAttribute("name", member.getName());
					session.setAttribute("email", member.getEmail());
					return "redirect:/userInfo";
				}
				
				return "/snsJoin";
				
			}
		
	
	//회원가입 후 회원정보 view
	@GetMapping("/userInfo")
	public void userInfo() {}
	
	// 회원정보 수정 view
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
	
	//비밀번호 변경 view
	@GetMapping("/mypage/changepwd")
	public void changepwd(HttpSession session, Model model) {
		String email = (String) session.getAttribute("email");
		if (email == null) {
			model.addAttribute("msg", "로그인이 필요한 페이지 입니다.");
		}
	}
	
	//비밀번호 변경
	@PostMapping("/mypage/changepwd")
	public void changepwd(String pwd, String newpwd, HttpSession session, Model model) {
		String email = (String) session.getAttribute("email");
		
		//회원의 현재 비밀번호 불러오기
		String tmp = service.getPwd(email);
		System.out.println("현재비밀번호 : "+tmp);
		
		if(!tmp.equals("") && tmp.equals(pwd)) {
			service.modifyPwd(email, newpwd);
			model.addAttribute("success",  "비밀번호 변경이 완료되었습니다.");
		}else {
			model.addAttribute("success",  "비밀번호 변경이 실패했습니다.");
		}
	}
	
	
	//비밀번호 찾기 ->임시비밀번호 생성
	@PostMapping("/findPwd")
	public String sendpwd(String email,   RedirectAttributes rttr) throws Exception {
		
		String pwd = service.getPwd(email);
		String tmpPwd = "";
		
		//현재비밀번호를 꺼내왔다면 임시비밀번호를 발급
				if(pwd != null) {
					tmpPwd = UUID.randomUUID().toString().replace("-", "");
					tmpPwd = tmpPwd.substring(0,9);
					System.out.println(tmpPwd);
				}
		
        if(!tmpPwd.equals("")) {
        	
        	service.modifyPwd(email, tmpPwd);
        	
        	e_mail.setTitle("sooltoryteller 비밀번호 찾기 메일입니다.");
            e_mail.setContent(
            		//줄바꿈
            		System.getProperty("line.separator") +
            		"안녕하세요 sooltoryteller 입니다." +
            		System.getProperty("line.separator")+
            		"고객님의 임시 비밀번호는 "+ tmpPwd+"입니다."+
            		System.getProperty("line.separator")+
            		"발급 받은 임시비밀번호로 로그인이 가능합니다."
            		);
        	
            e_mail.setTo(email);
            mailService.send(e_mail);
            rttr.addFlashAttribute("emailMsg", "이메일이 전송되었습니다.");
        }else {
        	
        	rttr.addFlashAttribute("emailMsg", "등록된 회원이 아닙니다. 이메일을 다시 입력하여 주세요");
        }
        return "redirect:/login";
    }
	
	//kakaoLogin code받기
	@RequestMapping(value = "/Koauth", produces = "application/json", method = {RequestMethod.POST, RequestMethod.GET})
	public String kakaologin(@RequestParam("code")String code, HttpServletRequest request,
			HttpServletResponse response, HttpSession session, Model model) {
		
		System.out.println("kakaologin code:"+code);
		
		ModelAndView mav = new ModelAndView();
		
		JsonNode node = KakaoLoginController.getKakaoAccessToken(code);
		JsonNode accessToken = node.get("access_token");
		JsonNode userInfo = KakaoLoginController.getKakaoUserInfo(accessToken);
		
		String kemail = null;
		String kimg = null;
		
		JsonNode properties = userInfo.path("properties");
		JsonNode kakao_account = userInfo.path("kakao_account");
		
		kemail = kakao_account.path("email").asText();
		kimg = properties.path("profile_image").asText();
		
		System.out.println("userInfo:"+userInfo);
		System.out.println("kimg .... : "+kimg);
		
		
//		mav.addObject("email", kemail);
//		mav.addObject("img", kimg);
//		mav.setViewName("snsJoin");
		if(service.checkEmail(kemail) == 1) {
			session.setAttribute("email", kemail);
			return "home";
		}else {
		
			model.addAttribute("email", kemail);
			model.addAttribute("img", kimg);
			return "snsJoin";
		}
	}
	
	}

