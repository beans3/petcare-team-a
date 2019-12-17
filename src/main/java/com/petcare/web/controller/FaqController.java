package com.petcare.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.petcare.web.domain.FaqVO;
import com.petcare.web.domain.MemberVO;
import com.petcare.web.domain.UserVO;
import com.petcare.web.service.FaqService;

@Controller
@RequestMapping("/faq")
public class FaqController {
	
	@Autowired
	private FaqService faqService;
	
	//글 목록
	@GetMapping("/faqList")
	public String FaqList(Model model, MemberVO member) {
		List<FaqVO> faqList = faqService.faqList();
		model.addAttribute("faqList", faqList);
		
		return "faq/faqList";
	}
	
	//글쓰기 페이지
	@GetMapping("/faqForm")
	public String FaqForm(@ModelAttribute UserVO user, HttpServletRequest req) {
		return "faq/faqForm";
	}
	
	//글쓰기 
	@PostMapping("/faqInsert")
	public String Insert(@ModelAttribute FaqVO faq){
		faqService.insert(faq);
		return "redirect:/faq/faqList";
	}
	
	//글 보기 페이지
	@PostMapping("/faqView")
	public String View(@ModelAttribute FaqVO faq, HttpServletRequest request, Model model){
		int faqNo = Integer.parseInt(request.getParameter("faqNo"));
		faq.setFaqNo(faqNo);;
		
		FaqVO faqView = faqService.view(faq);
		model.addAttribute("view", faqView);
		
		return "faq/faqView";
	}
	
	//글 수정 페이지
	@RequestMapping("/faqModify")
	public String faqModify(@ModelAttribute("faq") FaqVO faq, HttpServletRequest request, Model model) {
		
		// 글 번호 int 값으로 가져와서 faqNo에 저장
		int faqNo = Integer.parseInt(request.getParameter("faqNo"));
		faq.setFaqNo(faqNo);
		
		// 저장한 faqNo로 게시글 select한 뒤 model 객체에 추가
		FaqVO faqModify = faqService.modifyView(faq);
		model.addAttribute("faqModify", faqModify);
		
		return "faq/faqModify";
	}
	
	//글 수정
	@RequestMapping("/modify")
	public String modify(FaqVO faq) {
			
		faqService.update(faq);
			
		return "redirect:/faq/faqList";
		
	}
	
	//글 삭제 페이지
	@GetMapping("/delete")
	public String Delete(@ModelAttribute FaqVO faq){
		faqService.delete(faq);
		return "redirect:/faq/faqList";		
	}

}
