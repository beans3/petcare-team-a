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
	/**
	 * 회원가입 페이지(일반유저)로 이동
	 * */
	@GetMapping("/normal")
	public String normal(Model model) {
		model.addAttribute("user", new UserVO());
		return "join/user";
	}
	
	/*
	 * public String register(@ModelAttribute("user") @Valid UserVO user,
	 * BindingResult result) {
	 */
	/**
	 * 회원가입 기능 처리
	 * */	
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
	
	/**
	 * 회원수정 페이지(일반유저)로 이동
	 * */	
	@GetMapping("/modifyForm")
	public String modify(@ModelAttribute("user") UserVO user, HttpServletRequest request, Model model) {
		//세션정보(일반유저) 가져오기
		HttpSession session = request.getSession();
		user = (UserVO)session.getAttribute("user");
		//세션에 저장된 유저 아이디를 갖고와서 현재 페이지에 유저 아이디 set
		user.setUserId(user.getUserId());
		
		UserVO newuser = MemberService.getList(user);
		model.addAttribute("list", newuser);
		
		return "user/modify";
	}
	
	/*
	 * public String update(@ModelAttribute("user") @Valid UserVO user,
	 * BindingResult result)
	 */
	/**
	 * 회원수정(일반유저)기능 처리
	 * */	
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
	
	/**
	 * 회원(일반유저) 아이디 중복 체크
	 * */	
	@PostMapping("/check_id")
	@ResponseBody
	public void selectId(@RequestParam("userId") String id, HttpServletResponse response) throws IOException
	{
		PrintWriter out = response.getWriter();
		int count = MemberService.selectID(id);
		//아이디가 존재하지 않으면 true 반환
		if(count == 0) {
			out.print(true);
		}else if(count == 1) {
			out.print(false);
		}
	}
	
	/**
	 * 회원(일반유저) 이메일 중복 체크
	 * */
	@PostMapping("/check_email")
	@ResponseBody
	public void selectEmail(@RequestParam("userEmail") String email, HttpServletResponse response) throws IOException
	{
		PrintWriter out = response.getWriter();
		int count = MemberService.selectEmail(email);
		//이메일이 존재하지 않으면 true 반환
		if(count == 0) {
			out.print(true);
		}else if(count == 1) {
			out.print(false);
		}
	}
}