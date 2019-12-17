package com.petcare.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.petcare.web.domain.UserVO;
import com.petcare.web.service.MemberService;
import com.petcare.web.validator.MemberValidator;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberService MemberService;
	
    @Autowired
    private MemberValidator memberValidator;
    
    // ServletConfig에서 생성한 bean
 	// @Autowired
 	// private BCryptPasswordEncoder passwordEncoder;
	  
    @InitBinder
    private void initBinder(WebDataBinder webDataBinder) {
        webDataBinder.setValidator(memberValidator);
    }

	@GetMapping("/normal")
	public String normal(Model model) {
		model.addAttribute("user", new UserVO());
		return "user/normalRegister";
	}
	
	@PostMapping("/user")
	public String register(@ModelAttribute("user") @Valid UserVO user, BindingResult result) {
		
		// user의 비밀번호를 암호화된 비밀번호로 저장
		// String encPassword = passwordEncoder.encode(user.getUserPw());
		// user.setUserPw(encPassword);
		
		String msg = null;
		
		if(result.hasErrors()) {
			
			  List<FieldError> errors = result.getFieldErrors(); 
			  for(FieldError error : errors) { 
				  msg = error.getDefaultMessage(); 
			  }
			 
			return "user/normalRegister";
		}
		MemberService.register(user);
		return "redirect:/index";
	}
	
	@GetMapping("/modifyForm")
	public String modify(@ModelAttribute("user") UserVO user, HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		user = (UserVO)session.getAttribute("user");
		user.setUserId(user.getUserId());
		
		UserVO newuser = MemberService.getList(user);
		model.addAttribute("list", newuser);
		
		return "user/modify";
	}
	
	@PostMapping("/modify")
	public String update(@ModelAttribute("user") UserVO user)
	{
		MemberService.update(user);
		return "redirect:/index";
	}
}