package com.petcare.web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.petcare.web.domain.UserVO;
import com.petcare.web.service.MemberService;
import com.petcare.web.validator.MemberValidator;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberService MemberService;
	
	/*
	 * @Autowired private MemberValidator memberValidator;
	 */
	  
	/*
	 * @InitBinder private void initBinder(WebDataBinder webDataBinder) {
	 * webDataBinder.setValidator(memberValidator); }
	 */
	@GetMapping("/normal")
	public String normal(Model model) {
		model.addAttribute("user", new UserVO());
		return "join/user";
	}
	
	/*
	 * public String register(@ModelAttribute("user") @Valid UserVO user,
	 * BindingResult result) {
	 */
	@PostMapping("/join")
	public String register(@ModelAttribute("user") UserVO user) {
		//String msg = null;
		
		/*
		 * if(result.hasErrors()) {
		 * 
		 * List<FieldError> errors = result.getFieldErrors(); for(FieldError error :
		 * errors) { msg = error.getDefaultMessage(); }
		 * 
		 * return "registerSelect"; }
		 */
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
	
	/*
	 * public String update(@ModelAttribute("user") @Valid UserVO user,
	 * BindingResult result)
	 */
	@PostMapping("/modify")
	public String update(@ModelAttribute("user") UserVO user)
	{
		/*
		 * String msg = null;
		 * 
		 * if(result.hasErrors()) {
		 * 
		 * List<FieldError> errors = result.getFieldErrors(); for(FieldError error :
		 * errors) { msg = error.getDefaultMessage(); }
		 * 
		 * return "user/modify"; }
		 */
		MemberService.update(user);
		return "redirect:/index";
	}
	
	@PostMapping("/check_id")
	@ResponseBody
	public void selectId(@RequestParam("userId") String id, HttpServletResponse response) throws IOException
	{
		PrintWriter out = response.getWriter();
		int count = MemberService.selectID(id);
		if(count == 0) {
			out.print(true);
		}else if(count == 1) {
			out.print(false);
		}
	}
	
	@PostMapping("/check_email")
	@ResponseBody
	public void selectEmail(@RequestParam("userEmail") String email, HttpServletResponse response) throws IOException
	{
		PrintWriter out = response.getWriter();
		int count = MemberService.selectEmail(email);
		if(count == 0) {
			out.print(true);
		}else if(count == 1) {
			out.print(false);
		}
	}
}