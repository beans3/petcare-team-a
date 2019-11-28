package com.petcare.web.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.petcare.web.domain.PetVO;
import com.petcare.web.domain.UserVO;
import com.petcare.web.domain.Criteria;
import com.petcare.web.domain.PageDto;
import com.petcare.web.service.PetService;

@Controller
@RequestMapping("/pet")
public class PetController {

	@Autowired
	private PetService service;
	

	//동물 리스트
	@GetMapping("/list")
	public void list(HttpSession httpSession, Criteria cri, Model model) {
		
		UserVO user = (UserVO) httpSession.getAttribute("user");
		
		List<PetVO> pets = new ArrayList<PetVO>();
		pets = service.getList(cri, user.getUserId());
		
		model.addAttribute("list", pets);
		
		int total =service.getTotal(cri);
		
		model.addAttribute("pageMaker", new PageDto(cri, total));
	}
	
	//동물 등록페이지 이동
	@GetMapping("/register")
	public void register(@ModelAttribute("pet") PetVO pet) {
		
	}
	
	//동물 등록
	@PostMapping("/register")
	public String register(@Validated @ModelAttribute("pet") PetVO pet, BindingResult bindingResult, RedirectAttributes rttr) {
		
		if(bindingResult.hasErrors()) {
			return "/pet/register";
		}

		service.register(pet);
		rttr.addFlashAttribute("regist", pet.getPetAge());
		
		return "redirect:/pet/list";
	}
	
	//동물 정보 조회/수정 페이지 이동
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("petNo") int petNo, @ModelAttribute("cri") Criteria cri, Model model) {
		model.addAttribute("pet", service.get(petNo));
		
	}
	
	//둥물 정보 수정
	@PostMapping("/modify")
	public String modify(@Validated @ModelAttribute("pet") PetVO pet, BindingResult bindingResult, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		if(bindingResult.hasErrors()) {
			return "/pet/modify";
		}
		
		if(service.modify(pet)) {
			rttr.addFlashAttribute("modify", pet.getPetNo());
		}

		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/pet/list";
	}
	
	//동물 정보 삭제
	@PostMapping("/remove")
	public String remove(@RequestParam("petNo") int petNo, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		if(service.remove(petNo)) {
			rttr.addFlashAttribute("remove", petNo);
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/pet/list";
	}
}
