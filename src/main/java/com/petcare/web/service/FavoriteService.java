package com.petcare.web.service;

import java.util.List;

import com.petcare.web.domain.FavoriteVO;

public interface FavoriteService {
	
	public String check(String userId, String hospitalId); //즐겨찾기 체크
	public void register(FavoriteVO favorite); //즐겨찾기 등록
	public void delete(int favoriteNo); //즐겨찾기 삭제
	public List<FavoriteVO> selectForUser(String userId); //환자용 즐겨찾기
	public List<FavoriteVO> selectForHospital(String hospitalId); //병원용 즐겨찾기

}
