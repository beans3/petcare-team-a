package com.petcare.web.controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.petcare.web.domain.Hospital;
import com.petcare.web.domain.UserVO;
import com.petcare.web.service.HospitalService;
import com.petcare.web.service.MemberService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private MemberService MemberService;
	
	@Autowired
	private HospitalService hospitalService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = {"/","/index"}, method = RequestMethod.GET)
	public String home() {		
		return "index";
	}
	
	@GetMapping("/login")
	public String login(Model model) {
		model.addAttribute("user", new UserVO());
		model.addAttribute("hospitaluser", new Hospital());
		model.addAttribute("hospital", new Hospital());
		return "loginForm";
	}
	
	@PostMapping("/loginPro")
	public void loginProcess(@ModelAttribute("user") UserVO user, Model model) {
		UserVO saved = MemberService.loginPro(user);
		if (saved != null) {
		}
		model.addAttribute("user", saved);
	}
	
	@PostMapping("/loginPro2")
	public String loginProcess2(@ModelAttribute("hospital") Hospital hospitaluser, Model model, HttpSession session, HttpServletRequest request) {
		
		String returnURL ="";
        if ( session.getAttribute("hospital") != null ){
            // 기존에 hospitaluser라는 세션 값이 존재한다면
            session.removeAttribute("hospital"); // 기존값을 제거해 준다.
        }
         
        // 로그인이 성공하면 Hospital 객체를 반환함.
        Hospital hospital = hospitalService.loginPro2(hospitaluser);
         
        if ( hospital != null ){ // 로그인 성공
            session.setAttribute("hospital", hospital); // 세션에 hospital인이란 이름으로 Hospital 객체를 저장해 놈.
            returnURL ="redirect:/index"; // 로그인 성공시 index로 바로 이동하도록 하고
        }else { // 로그인에 실패한 경우
            returnURL ="redirect:/login"; // 로그인 폼으로 다시 가도록 함
        }
         
        return returnURL; // 위에서 설정한 returnURL 을 반환, 이동
	}
	
	@GetMapping("/logout") public String logout() {
	return "redirect:/index";
	}
	
	@GetMapping("/select")
	public String registerS() {
		return "user/registerSelect";

	}
}
