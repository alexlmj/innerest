package com.innerest.home.web;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.innerest.common.user.UserVO;
import com.innerest.home.LoginVO;
import com.innerest.home.impl.HomeSrv;

/**
 * 로그인, 회원가입, 로그아웃, 계정찾기, 메인
 * 
 * 추가예정
 *  - Exception을 사용하여 에러 세부 컨트롤
 *  - 다국어 지원
 *  - Interceptor
 *  - json 리턴 형식 지정 ( {msg: , status: 등... } );
 */
@Controller
public class HomeController {
	
	@Inject
	private HomeSrv homeSrv;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/*메인*/
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "home";
	}
	
	/*가입*/
	@RequestMapping(value = "/regist", method = RequestMethod.GET)
	public String registForm() {
		return "regist";
	}
	
	@RequestMapping(value = "/regist", method = RequestMethod.POST)
	public String regist(UserVO user, HttpSession session) {
		if(homeSrv.regist(user)) {
			logger.debug("[REGIST:{},{}]", user.getNum(), user.getId());
			return "redirect:/login";
		}
		//error 페이지
		return "redirect:/error";
	}
	
	@ResponseBody
	@RequestMapping(value = "/regist/idc", method = RequestMethod.POST)
	public String idcheck(@RequestBody String id) {
		if(homeSrv.isIdDuplicated(id)) {
			return "duple";
		}
		return "new";
	}
	
	/*로그인*/
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginForm() {
		return "login";
	}
	
	@ResponseBody
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(LoginVO login, HttpSession session) {
		
		UserVO user = homeSrv.login(login);
		if(user == null) {
			return "fail";
		}
		
		int cart = homeSrv.getCart(user.getNum());
		
		session.setAttribute("num", user.getNum());
		session.setAttribute("id", user.getId());
		session.setAttribute("role", user.getRole());
		session.setAttribute("cart", cart);
		return "success";
	}
	
	/*로그아웃*/
	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) {
		Integer num = (Integer)session.getAttribute("num");
		String id = (String)session.getAttribute("id");
		String role = (String)session.getAttribute("role");
		
		logger.debug("[LOGOUT:{},{},{}]",num,id,role);
		session.invalidate();
		return "redirect:/";
	}
	
	/*계정찾기*/
	@RequestMapping(value = "/findIdPw", method = RequestMethod.GET)
	public String findIdPwForm() {
		return "findIdPw";
	}
	
	@ResponseBody
	@RequestMapping(value = "/findIdPw", method = RequestMethod.POST)
	public String sendEmailToFindIdPw(String email) {
		if(!homeSrv.sendEamilTofindIdPw(email)) {
			return "fail";
		}
		return "success";
	}
	
	/*비밀번호변경*/
	@RequestMapping(value = "/password", method = RequestMethod.GET)
	public String changePwForm(String emailtoken, Model model) {
		model.addAttribute("emailtoken", emailtoken);
		return "password";
	}
	
	@RequestMapping(value = "/password", method = RequestMethod.POST)
	public String changePw(String emailtoken, String pw) {
		
		if(!homeSrv.modifyPw(emailtoken, pw)) {
			return "redirect:/error";
		}
		return "redirect:/";
	}
}
