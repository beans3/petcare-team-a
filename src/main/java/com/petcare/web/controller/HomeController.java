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
public class HomeController {
	
	@Autowired
	private MemberService MemberService;
	
	@Autowired
	private HospitalService hospitalService;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@RequestMapping(value = {"/","/index"}, method = RequestMethod.GET)
	public String home() {		
		return "index";
	}
	
}
