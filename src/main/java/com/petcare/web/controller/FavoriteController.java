package com.petcare.web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.petcare.web.domain.FavoriteVO;
import com.petcare.web.domain.Hospital;
import com.petcare.web.domain.UserVO;
import com.petcare.web.service.FavoriteService;

@Controller
@RequestMapping("/favorite")
public class FavoriteController {
	@Autowired
	private FavoriteService favoriteService;

	//즐겨찾기 등록
	@Transactional
	@GetMapping("/register")
	public String favoriteInsert(HttpSession session, FavoriteVO favorite, Model model) {
		UserVO user = (UserVO) session.getAttribute("user");
		user.getUserId();
		favorite.getHospitalId();
		favorite.setUserId(user.getUserId());
		favoriteService.register(favorite);
		List<FavoriteVO> hospitals = favoriteService.selectForUser(user.getUserId());
		model.addAttribute("favorites", hospitals);
		return "favorite/favorite";
	}
	
	//즐겨찾기 삭제
	@Transactional
	@GetMapping("/delete")
	public String favoriteDelete(HttpSession session, @RequestParam("favoriteNo") int favoriteNo, Model model) {
		UserVO user = (UserVO) session.getAttribute("user");
		user.getUserId();
		favoriteService.delete(favoriteNo);
		List<FavoriteVO> hospitals = favoriteService.selectForUser(user.getUserId());
		model.addAttribute("favorites", hospitals);
		return "favorite/favorite";
	}
	
	//환자용 즐겨찾기
	@GetMapping("/foruser")
	public String favoriteForUser(HttpSession session, Model model){
		UserVO user = (UserVO) session.getAttribute("user");
		List<FavoriteVO> hospitals = favoriteService.selectForUser(user.getUserId());
		model.addAttribute("favorites", hospitals);
		//model.addAllAttributes(hospitals);
		return "favorite/favorite";
	}

	//병원용 즐겨찾기
	@GetMapping("/forhospital")
	public String favoriteForHospital(HttpSession session, Model model){
		Hospital hospital = (Hospital) session.getAttribute("hospital");
		List<FavoriteVO> users = favoriteService.selectForHospital(hospital.getHospitalId());
		model.addAttribute("favorites", users);
		return "favorite/favorite";
	}

}
