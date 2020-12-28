package com.sooltoryteller.controller;
import java.io.IOException;
import java.util.Arrays;
import java.util.UUID;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
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
import com.github.scribejava.core.model.OAuth2AccessToken;
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
	/*
	private NaverLoginController naverLoginController;
	private String apiResult = null;
	*/
	/*
	@Resource(name = "uploadPath")
	private String uploadPath;
	*/
	
	/*
	@Autowired
	private void setNaverLoginController(NaverLoginController naverLoginController) {
		this.naverLoginController = naverLoginController;
	} 
	*/
	
	//로그인 view
	   @GetMapping("/login")
	   public ModelAndView login(HttpSession session, HttpServletRequest request) {
	      ModelAndView mav = new ModelAndView();
	      
	      String referer = (String)request.getHeader("REFERER");
	      String kakaoUrl = kakaoController.getAuthorizationUrl(session);
	      //String naverUrl = naverLoginController.getAuthorizationUrl(session);
	      
	      mav.setViewName("login");
	      mav.addObject("kakaoUrl", kakaoUrl);
	     // mav.addObject("naverUrl", naverUrl);
	      request.getSession().setAttribute("referer", referer);
	      
	      return mav;
	   }
	   
	   @PostMapping("/login")
	   public String login(String email, String pwd, HttpServletRequest request, HttpServletResponse response,
	         HttpSession session, RedirectAttributes rttr) {
	      
	      String referer = (String) session.getAttribute("referer");
	      System.out.println("이전페이지 url : "+referer);
	      
	      // id저장 체크박스
	      String save = request.getParameter("save");
	      //HttpSession session = request.getSession();
	      Cookie cookie = new Cookie("email", email);
	      // 입력받은 이메일, 비밀번호 정보가 db상의 정보와 일치하는 것이 있는지 조회
	      if (service.loginCheck(email, pwd)) {
	         session.setAttribute("email", email);
	         session.setAttribute("authority", service.getAuthority(email));
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
	      }
	      return "redirect:"+referer;
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
		if(result.hasErrors()) {
			model.addAttribute("member", member);
			model.addAttribute("msg", "server : 입력 형식에 맞지 않습니다.");
			return "/join";
		}
		
		//선호하는 술 체크 배열로 받아오기
		String[] arr = request.getParameterValues("drink");
		
		System.out.println("arr : "+arr);
		
		if(arr == null || arr.length !=2) {
			model.addAttribute("member", member);
			model.addAttribute("msg", "server : 선호하는 주종은 2개 선택해야 합니다.");
			return "/join";
		}else {
		
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
				model.addAttribute("name", member.getName());
				model.addAttribute("email", member.getEmail());
				
				return "/snsJoin";
				
			}
		
	
	//회원가입 후 회원정보 view
	@GetMapping("/userInfo")
	public void userInfo() {}
	
	//선호하는 주종 꺼내오기
	@RequestMapping(value = "/mypage/getFavAlc", method = RequestMethod.POST) 
	public @ResponseBody String[] getFavAlc(@RequestParam(value="favalc[]")String[] favalc, HttpSession session) {

		String email = (String) session.getAttribute("email");
		Long memberId = service.getMemberId(email);
		String[] drink = {};
		int[] result = new int[favalc.length];
		
		System.out.println(Arrays.toString(favalc));
		System.out.println("memberId : "+memberId);
		if(favalc != null) {
			for (int i = 0; i < favalc.length; i++) {
				result[i] =Integer.parseInt(favalc[i]);
			}
			
			drink = favDrkService.getFavNameList(result);
			
			if(memberId != null) {
				favDrkService.modifyFavDrk(memberId, result);
			}
		}
		
		System.out.println("drink : "+drink);
			  return drink;
	}
	
	// 회원정보 수정 view
	@GetMapping("/mypage/changeuserinfo")
	public void changeuserinfo(HttpSession session, Model model, RedirectAttributes rttr) {
		// 로그인 성공 후 세션에 저장된 email 정보를 꺼내와서 member 정보를 불러옴
		String email = (String) session.getAttribute("email");
		if (email == null) {
			model.addAttribute("msg", "로그인이 필요한 페이지 입니다.");
		} else {
			Long memberId = service.getMemberId(email);
			System.out.println("memberId : "+memberId);
			model.addAttribute("favList", favDrkService.getFavList(memberId));
			model.addAttribute("member", service.get(email));
		}
	}
	// 회원정보수정
	@PostMapping("/mypage/changeuserinfo")
		public void changeuserinfo(MemberVO member, HttpSession session, Model model) throws Exception {
		//public void changeuserinfo(MemberVO member, HttpSession session, MultipartFile file, Model model) throws Exception {
		String loginEmail = (String) session.getAttribute("email");
		System.out.println("changeUserInfo: " + member);
		System.out.println("changeUserInfo: " + loginEmail);
		
		/*
		// 첨부파일 업로드 설정
		String imgUploadPath = uploadPath + File.separator + "imgUpload"; // 이미지를 업로드할 폴더를 설정 = /uploadPath/imgUpload
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath); // 위의 폴더를 기준으로 연월일 폴더를 생성
		String fileName = null; // 기본 경로와 별개로 작성되는 경로 + 파일이름

		if(file != null || !file.getOriginalFilename().equalsIgnoreCase("user.png")) { 
			fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
			member.setImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			member.setThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		} else { // input box에 첨부된 파일이 없다면 = 첨부된 파일의 이름이 없다면
			// user.png 파일로 대체
			fileName = File.separator + "images" + File.separator + "user.png";
			member.setImg(fileName);
			member.setThumbImg(fileName);
		}
		*/

		if(!loginEmail.equals(member.getEmail())) {
			model.addAttribute("errorMsg", "잘 못 된 접근입니다.");
			model.addAttribute("member", service.get(loginEmail));
			model.addAttribute("favList", favDrkService.getFavList(service.getMemberId(loginEmail)));
			/*
			model.addAttribute("img", service.get(member.getImg()));
			model.addAttribute("thumbImg", service.get(member.getThumbImg()));
			*/
			return;
			
		}else {
		// 닉네임,  전화번호, 프로필사진만 변경
			if(service.modify(member)) {
				model.addAttribute("success", "회원 정보가 수정되었습니다.");
				model.addAttribute("member", service.get(member.getEmail()));
				model.addAttribute("favList", favDrkService.getFavList(service.getMemberId(member.getEmail())));
				/*
				model.addAttribute("img", service.get(member.getImg()));
				model.addAttribute("thumbImg", service.get(member.getThumbImg()));
				*/
			}else {
				model.addAttribute("errorMsg", "sever : 잘 못 된 입력 입니다.");
				model.addAttribute("member", service.get(loginEmail));
				model.addAttribute("favList", favDrkService.getFavList(service.getMemberId(loginEmail)));
				/*
				model.addAttribute("img", service.get(member.getImg()));
				model.addAttribute("thumbImg", service.get(member.getThumbImg()));
				*/
			}
		}
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
		}else {
			model.addAttribute("member", service.get(email));
		}
	}
	
	//비밀번호 변경
	@PostMapping("/mypage/changepwd")
	public void changepwd(String pwd, String newPwd, HttpSession session, Model model) {
		String email = (String) session.getAttribute("email");
		
		System.out.println("새로운 비밀번호 : "+newPwd);
		//회원의 현재 비밀번호 검사
		if(service.examinePwd(email, pwd)) {
			service.modifyPwd(email, newPwd);
			model.addAttribute("member", service.get(email));
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
					tmpPwd += "!@#";
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
		
		if(service.checkEmail(kemail) == 1) {
			session.setAttribute("email", kemail);
			return "home";
		}else {
		
			model.addAttribute("email", kemail);
			model.addAttribute("img", kimg);
			return "snsJoin";
		}
	}
/*	
	//네이버 로그인
	@RequestMapping(value = "/Noauth", method = {RequestMethod.POST, RequestMethod.GET})
	public String naverLogin(Model model, @RequestParam String code,
			@RequestParam String state,HttpSession session) throws IOException, ParseException {
		
		String referer = (String) session.getAttribute("referer");
		System.out.println("이전페이지 url : "+referer);
		
		OAuth2AccessToken oauthToken = naverLoginController.getAccessToken(session, code, state);
		
		//로그인 사용자 정보를 읽어옴
		apiResult = naverLoginController.getUserProfile(oauthToken);
		
		//apiResult를 string -> json
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject)obj;
		
		//데이터 파싱
		JSONObject responseObj = (JSONObject)jsonObj.get("response");
		String nemail = (String)responseObj.get("email");
		String mobile = (String)responseObj.get("mobile");
		String nimg = (String)responseObj.get("profile_image");
		
		System.out.println(nemail);
		System.out.println(mobile);
		System.out.println(nimg);
		
		if(service.checkEmail(nemail) == 1) {
			session.setAttribute("email", nemail);
			return "redirect:"+referer;
		}else {
		
			model.addAttribute("email", nemail);
			model.addAttribute("img", nimg);
			model.addAttribute("telno", mobile);
			return "snsJoin";
		}
	}
	*/
	}

