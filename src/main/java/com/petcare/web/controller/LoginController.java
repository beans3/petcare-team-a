package com.petcare.web.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.petcare.web.domain.Hospital;
import com.petcare.web.domain.UserVO;
import com.petcare.web.mapper.HospitalMapper;
import com.petcare.web.service.HospitalService;
import com.petcare.web.service.MemberService;

/**
 * Handles requests for the application home page.
 */

@Controller
public class LoginController {
	
	@Autowired
	private MemberService MemberService;
	
	@Autowired
	private HospitalService hospitalService;
	
//	@Autowired
//	private BCryptPasswordEncoder passwordEncoder;
	
	// 로그인 페이지
	@GetMapping("/login")
	public String login(Model model, HttpSession session, HttpServletRequest request) {
		
		// loginForm에서 model 객체에 추가
		model.addAttribute("user", new UserVO());
		model.addAttribute("hospital", new Hospital());
		model.addAttribute("hospitaluser", new Hospital());
		
		return "login/loginForm";
	}
	
	// 일반회원 로그인
	@PostMapping("/loginPro")
	public void loginProcess(@ModelAttribute("user") UserVO user, Model model) {
		
		// MemberService.loginPro 실행하여 saved에 저장
		// SELECT * FROM USER WHERE user_id = #{userId} AND user_pw = #{userPw}
		UserVO saved = MemberService.loginPro(user);
		
		// model 객체에 "user"라는 이름으로 저장
		model.addAttribute("user", saved);
	
	}
	
	// 병원회원 로그인
	@PostMapping("/loginPro2")
	public void loginProcess2(@ModelAttribute("hospital") Hospital hospital, Model model) {
		
// 		  db에 저장된 비밀번호와 encode한 비밀번호 비교
//		  String rawPassword = hospital.getHospitalPw();
//		  String encodedPassword = passwordEncoder.encode(rawPassword);
//
//		  if(passwordEncoder.matches(rawPassword, encodedPassword);) {
//			  System.out.println("비밀번호 일치");
//		  } else {
//			  System.out.println("비밀먼호 불일치");
//		  }
		  
		  Hospital hos = hospitalService.loginPro2(hospital);
		  model.addAttribute("hospital", hos);

	}
	
	@GetMapping("/logout")
	public String logout() {
		return "redirect:/index";
	}
	
	@GetMapping("/select")
	public String registerS() {
		return "user/registerSelect";

	}
	
}
