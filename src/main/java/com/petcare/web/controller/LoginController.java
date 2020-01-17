package com.petcare.web.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.petcare.web.domain.Hospital;
import com.petcare.web.domain.UserVO;
import com.petcare.web.interceptor.HospitalLoginInterceptor;
import com.petcare.web.service.HospitalService;
import com.petcare.web.service.MemberService;

/**
 * Handles requests for the application home page.
 */

@Controller
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(HospitalLoginInterceptor.class);
	
	@Autowired
	private MemberService MemberService;
	
	@Autowired
	private HospitalService hospitalService;
	
//	@Autowired
//	private BCryptPasswordEncoder passwordEncoder;
	
	// 로그인 페이지
	@GetMapping("/login")
	public String login(@ModelAttribute("hospital") Hospital hospital, Model model, HttpSession session, HttpServletRequest request) {
		
		// loginForm에서 model 객체에 추가
		model.addAttribute("user", new UserVO());
		// model.addAttribute("hospital", new Hospital());
		
		return "login/loginForm";
	}
	
	// 일반회원 로그인
	@PostMapping("/loginPro")
	public void loginProcess(@ModelAttribute("user") UserVO user, Model model, BindingResult bindingResul) {
		
		UserVO saved = MemberService.loginPro(user);
		
		//db에 저장된 비밀번호와 encode한 비밀번호 비교
		if(saved == null || !BCrypt.checkpw(user.getUserPw(), saved.getUserPw())) {
			model.addAttribute("user", null);
			return;
		}

		model.addAttribute("user", saved);
	
	}
	
	// 병원회원 로그인
	@PostMapping("/loginPro2")
	public void loginProcess2(Hospital hospitalVO, Model model, HttpSession session, HttpServletRequest response) {
		
		Hospital hos = hospitalService.loginPro2(hospitalVO);
		
		//db에 저장된 비밀번호와 encode한 비밀번호 비교
		if(hos == null || !BCrypt.checkpw(hospitalVO.getHospitalPw(), hos.getHospitalPw())) {
			model.addAttribute("hospital", null);
			return;
		}

		model.addAttribute("hospital", hos);

	}
	
	@GetMapping("/logout")
	public String logout() {
		return "redirect:/index";
	}
	
}
