package com.petcare.web.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.petcare.web.domain.AppointmentVo;
import com.petcare.web.domain.Criteria;
import com.petcare.web.domain.MedicalRecordVO;
import com.petcare.web.domain.PageDto;
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
		
		//예약 번호로 정보 갖고온다.
		AppointmentVo appointmentVo = medicalRecordService.getApptInfo(apptNo);
		//예약번호 갖고와서 동물 번호 set
		medicalRecordVO.setApptNo(apptNo);
		medicalRecordVO.setPetNo(appointmentVo.getPetNo());
		int rgstYn = medicalRecordService.insertMedicalRc(medicalRecordVO);
		//에러 시 alert창 이후 이전 페이지 로드
		if(rgstYn < 1) {
			return "appointment/errorPage";
		}else {
			int rgstYn2 = medicalRecordService.updateMedicalRc(apptNo);
		}
		return "redirect:/appointment/list";
		
	}
	//리스트 페이지 이동
	@RequestMapping("/mrList")
	public String getMrList(HttpSession session, Model model,Criteria cri) {
		//세션값
		String hospitalId = (String) session.getAttribute("hospitalId");
		List<MedicalRecordVO> medicalRecords = new ArrayList<MedicalRecordVO>();
		medicalRecords = medicalRecordService.getRcList(hospitalId);
		model.addAttribute("medicalRecords", medicalRecords);
		int total = medicalRecordService.getTotal(cri);
		model.addAttribute("pageMaker", new PageDto(cri, total));
		return "/appointment/mrList";
	}
	
//	@PostMapping("/mrList")
//	public String postMrList() {
//		
//	}
}
