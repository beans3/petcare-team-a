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
	
	// 로그인 페이지
	@GetMapping("/login")
	public String login(Model model, HttpSession session, HttpServletRequest request) {

		model.addAttribute("user", new UserVO());
		model.addAttribute("hospital", new Hospital());
		model.addAttribute("hospitaluser", new Hospital());
		
		return "loginForm";
	}
	
	@PostMapping("/loginPro")
	public void loginProcess(@ModelAttribute("user") UserVO user, Model model) {

		UserVO saved = MemberService.loginPro(user);
		model.addAttribute("user", saved);
	}
	
	@PostMapping("/loginPro2")
	public void loginProcess2(@ModelAttribute("hospital") Hospital hospital, Model model) {
		
		Hospital hos = hospitalService.loginPro2(hospital);
		if (hos != null) {
		}
		model.addAttribute("hospital", hos);
	}
	
	@GetMapping("/logout") public String logout() {
	return "redirect:/index";
	}
	
	@GetMapping("/select")
	public String registerS() {
		return "user/registerSelect";

	}
	
}
