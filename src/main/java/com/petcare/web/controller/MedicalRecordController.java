package com.petcare.web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.petcare.web.domain.MedicalRecordVO;
import com.petcare.web.service.MedicalRecordService;


@Controller
@RequestMapping("/mr")
public class MedicalRecordController {
	
	@Autowired
	MedicalRecordService medicalRecordService;
	

	//병원진료페이지로 이동
	@GetMapping("/medicalRc")
	public String medicalRc(@RequestParam("apptNo") int apptNo, HttpSession session) {
		return "appointment/medicalRecord";
	}
	
	@PostMapping("/insertMedicalRc")
	public String insertMedicalRc(@RequestParam("apptNo") int apptNo, HttpSession session, @ModelAttribute MedicalRecordVO medicalRecordVO) {
		
		System.out.println("%%%%%%%%%모델 : "+medicalRecordVO);
		String hospitalId = (String) session.getAttribute("hospitalId");
		System.out.println("!!!!!!!!!!!!"+hospitalId);
		medicalRecordVO.setHospitalId(hospitalId);
		int rgstYn = medicalRecordService.insertMedicalRc(medicalRecordVO);
		
		if(rgstYn < 1) {
			
		}
		return "redirect:/appointment/list";
		
	}
	
	@PostMapping("/")
	public String mrList() {
		
		return "";
	}
}
