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

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.petcare.web.domain.Codename;
import com.petcare.web.domain.FavoriteVO;
import com.petcare.web.domain.Hospital;
import com.petcare.web.domain.UserVO;
import com.petcare.web.service.FavoriteService;
import com.petcare.web.service.HospitalService;

@Controller
@RequestMapping("/hospital")
public class HospitalController {

	@Autowired
	private HospitalService hospitalService;
	@Autowired
	private FavoriteService favoriteService;
	
	Map<String, Object> codename = new HashMap<String, Object>();
	List<String> cn = new ArrayList<String>();
	
	//병원 정보
	@GetMapping("/get")
	public void get(HttpSession session, String userId, String hospitalId, Model model) throws IOException {
		UserVO user = (UserVO) session.getAttribute("user");
		userId = user.getUserId();
		//즐겨찾기 등록 여부 검사
		String check = favoriteService.check(userId,hospitalId);
		model.addAttribute("check",check);
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
		System.out.println(list);
		model.addAttribute("codename",codename);
	}
	
	//병원 검색
	@GetMapping("/search")
	public String hospitalSearch(Model model, String hospitalName) {
		List<Hospital> search = hospitalService.search(hospitalName);
		for(int i=0; i<search.size(); i++){
			Map<String, String> map = (Map)search.get(i);
			String hid = (String)map.get("hospital_id");
			cn = hospitalService.codename(hid);
			codename.put(hid, cn);
		}
		model.addAttribute("search",search);
		System.out.println(search);
		model.addAttribute("codename",codename);
		return "hospital/list";
	}
	
	@GetMapping("/register")
	public String hospital(Model model) {
		model.addAttribute("hospital", new Hospital());
		return "hospitalRegister";
	}
	
	@PostMapping("/Join")
	public String register(Hospital hospital, HttpServletRequest request) {
		
		hospitalService.register(hospital);
		
		String[] list = request.getParameterValues("cCode");
		
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
	
	@PostMapping("/check_id")
	@ResponseBody
	public void selectID(@RequestParam("hospitalId") String id, HttpServletResponse response) throws IOException
	{
		PrintWriter out = response.getWriter();
		int count = hospitalService.selectID(id);
		if(count == 0) {
			out.print(true);
		}else if(count == 1) {
			out.print(false);
		}
	}
	
	@PostMapping("/check_email")
	@ResponseBody
	public void selectEmail(@RequestParam("hospitalEmail") String email, HttpServletResponse response) throws IOException
	{
		PrintWriter out = response.getWriter();
		int count = hospitalService.selectEmail(email);
		if(count == 0) {
			out.print(true);
		}else if(count == 1) {
			out.print(false);
		}
	}
	
	@GetMapping("/modifyForm")
	public String modify(@ModelAttribute("hospital") Hospital hospital, HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		hospital = (Hospital)session.getAttribute("hospital");
		
		String hospitalId = hospital.getHospitalId(); 
				
		List<Map<String, String>> codeList = hospitalService.getCharacter(hospitalId);
		System.out.println(codeList);
		
		Hospital newhospital = hospitalService.getList(hospitalId);
		model.addAttribute("list", newhospital);
		model.addAttribute("code", codeList);
		
		return "hospital/modify";
	}
	
	@PostMapping("/modify")
	public String update(Hospital hospital, HttpServletRequest request)
	{
		hospitalService.modify(hospital);
		
		String[] list = request.getParameterValues("cCode");
		
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