package com.petcare.web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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

import com.petcare.web.domain.Codename;
import com.petcare.web.domain.Hospital;
import com.petcare.web.domain.UserVO;
import com.petcare.web.service.FavoriteService;
import com.petcare.web.service.HospitalService;
import com.petcare.web.validator.HospitalValidator;

@Controller
@RequestMapping("/hospital")
public class HospitalController {

	@Autowired
	private HospitalService hospitalService;
	@Autowired
	private FavoriteService favoriteService;
	/*
	 * @Autowired private HospitalValidator hospitalValidator;
	 */
	
	// ServletConfig에서 생성한 bean
	//@Autowired
	//private BCryptPasswordEncoder passwordEncoder;
	
	Map<String, Object> codename = new HashMap<String, Object>();
	List<String> cn = new ArrayList<String>();
	
	/*
	 * @InitBinder private void initBinder(WebDataBinder webDataBinder) {
	 * webDataBinder.setValidator(hospitalValidator); }
	 */
	
	//병원 정보
	@GetMapping("/get")
	public void get(HttpSession session, String userId, String hospitalId, Model model) throws IOException {
		
		if(session.getAttribute("user") != null) {
		UserVO user = (UserVO) session.getAttribute("user");
		userId = user.getUserId();
		//즐겨찾기 등록 여부 검사
		String check = favoriteService.check(userId,hospitalId);
		model.addAttribute("check",check);
		}else; 
		model.addAttribute("hospital", hospitalService.view(hospitalId));
		model.addAttribute("codename", hospitalService.codename(hospitalId));
	}

	//병원 전체 리스트
	@GetMapping("/list")
	public void hospitalList(Model model) {
		//new ArrayList?
		ArrayList<Hospital> list = new ArrayList<Hospital>();
		list = (ArrayList<Hospital>) hospitalService.list();
		for(int i=0; i<list.size(); i++){
			Map<String, String> map = (Map)list.get(i);
			String hid = (String)map.get("hospital_id");
			cn = hospitalService.codename(hid);
			codename.put(hid, cn);
		}
		//all?
		model.addAttribute("list",list);
		model.addAttribute("codename",codename);
	}
	
	//병원 검색
	@GetMapping("/search")
	public String hospitalSearch(Model model, String choice, String searchValue, String searchWord) {
		// 이름인지 주소인지?
		System.out.println(searchValue);
		//searchWord를 받아와서 만들어줌
		System.out.println(searchWord);
		System.out.println(choice);
		
		List<Hospital> search = new ArrayList<Hospital>();
		if(searchValue.equals("name")) {
			search = hospitalService.searchName(searchWord);
			for(int i=0; i<search.size(); i++){
				Map<String, String> map = (Map)search.get(i);
				String hid = (String)map.get("hospital_id");
				//병원의 코드로 빼옴
				cn = hospitalService.codename(hid);
				codename.put(hid, cn);
				System.out.println("1번"+search);
			}
		}else if(searchValue.equals("address")) {
			search = hospitalService.searchAddress(searchWord);
			for(int i=0; i<search.size(); i++){
				Map<String, String> map = (Map)search.get(i);
				String hid = (String)map.get("hospital_id");
				cn = hospitalService.codename(hid);
				codename.put(hid, cn);
			}
		}else if(!choice.isEmpty()) {
			System.out.println(choice);
			//선택지 검색
		}
		model.addAttribute("search",search);
		model.addAttribute("codename",codename);
		return "hospital/list";
	}
	
	/**
	 * 회원가입 페이지(병원)로 이동
	 * */
	@GetMapping("/register")
	public String hospital(Model model) {
		model.addAttribute("hospital", new Hospital());
		return "join/hospital";
	}
	
	/*
	 * public String register(@ModelAttribute("hospital") @Valid Hospital hospital,
	 * BindingResult result, HttpServletRequest request)
	 */
	/**
	 * 회원가입 기능 처리
	 * */
	@PostMapping("/Join")
	public String register(Hospital hospital, HttpServletRequest request) 
	{
		
		/*
		 * String msg = null;
		 * 
		 * if(result.hasErrors()) {
		 * 
		 * List<FieldError> erros = result.getFieldErrors(); for(FieldError error:
		 * erros) { msg = error.getDefaultMessage(); }
		 * 
		 * return "join/hospital"; }
		 */
		
		// hospital의 비밀번호를 암호화된 비밀번호로 저장
		String hashedPw = BCrypt.hashpw(hospital.getHospitalPw(), BCrypt.gensalt());
		hospital.setHospitalPw(hashedPw);
		hospitalService.register(hospital);
		
		// form에 있는 checkbox에서 코드들의 값을 받아온다.
		String[] list = request.getParameterValues("cCode");
		
		// 반복문을 이용하여 codename객체에 값을 넣어주고 메서드를 이용해서 디비에 insert
		if(list != null) {
			for(int i = 0; i < list.length; i++) {
				Codename code = new Codename();
				code.setCCode(Integer.parseInt(list[i]));
				code.setHospitalId(hospital.getHospitalId());
				
				hospitalService.codeInsert(code);
			}
		}
		
		return "redirect:/index";
	}
	
	/**
	 * 회원(병원) 아이디 중복 체크
	 * */	
	@PostMapping("/check_id")
	@ResponseBody
	public void selectID(@RequestParam("hospitalId") String id, HttpServletResponse response) throws IOException
	{
		PrintWriter out = response.getWriter();
		int count = hospitalService.selectID(id);
		//아이디가 존재하지 않으면 true 반환
		if(count == 0) {
			out.print(true);
		}else if(count == 1) {
			out.print(false);
		}
	}
	
	/**
	 * 회원(병원) 이메일 중복 체크
	 * */
	@PostMapping("/check_email")
	@ResponseBody
	public void selectEmail(@RequestParam("hospitalEmail") String email, HttpServletResponse response) throws IOException
	{
		PrintWriter out = response.getWriter();
		int count = hospitalService.selectEmail(email);
		//이메일이 존재하지 않으면 true 반환
		if(count == 0) {
			out.print(true);
		}else if(count == 1) {
			out.print(false);
		}
	}
	
	/**
	 * 회원수정 페이지(병원)로 이동
	 * */	
	@GetMapping("/modifyForm")
	public String modify(@ModelAttribute("hospital") Hospital hospital, HttpServletRequest request, Model model) {
		//세션정보(병원) 가져오기
		HttpSession session = request.getSession();
		hospital = (Hospital)session.getAttribute("hospital");
		//세션에 저장된 유저 아이디를 갖고와서 현재 페이지에 유저 아이디 set
		String hospitalId = hospital.getHospitalId(); 
		
		//리스트맵에 코드정보 담기
		List<Map<String, String>> codeList = hospitalService.getCharacter(hospitalId);
		System.out.println(codeList);
		
		Hospital newhospital = hospitalService.getList(hospitalId);
		model.addAttribute("list", newhospital);
		model.addAttribute("code", codeList);
		
		return "hospital/modify";
	}
	
	/*
	 * public String update(@ModelAttribute("hospital") @Valid Hospital hospital,
	 * BindingResult result, HttpServletRequest request)
	 */
	/**
	 * 회원수정(일반유저)기능 처리
	 * */	
	@PostMapping("/modify")
	public String update(Hospital hospital, HttpServletRequest request)
	{
		/*
		 * String msg = null;
		 * 
		 * if(result.hasErrors()) {
		 * 
		 * List<FieldError> erros = result.getFieldErrors(); for(FieldError error:
		 * erros) { msg = error.getDefaultMessage(); }
		 * 
		 * return "join/hospital"; }
		 */
		hospitalService.modify(hospital);
		
		// form에 있는 checkbox에서 코드들의 값을 받아온다.
		String[] list = request.getParameterValues("cCode");
		
		// 반복문을 이용하여 codename객체에 값을 넣어주고 메서드를 이용해서 디비에 insert
		if(list != null) {
			for(int i = 0; i < list.length; i++) {
				Codename code = new Codename();
				code.setCCode(Integer.parseInt(list[i]));
				code.setHospitalId(hospital.getHospitalId());
				
				hospitalService.codeInsert(code);
			}
		}
		
		return "redirect:/index";
	}
	
	
}