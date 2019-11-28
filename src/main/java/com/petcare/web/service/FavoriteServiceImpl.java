package com.petcare.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.petcare.web.domain.FavoriteVO;
import com.petcare.web.mapper.FavoriteMapper;

@Service
public class FavoriteServiceImpl implements FavoriteService {
	
	@Autowired
	private FavoriteMapper favoriteMapper;
	
	//즐겨찾기 체크
	@Override
	public String check(String userId, String hospitalId) {
		String result = favoriteMapper.checkFavorite(userId, hospitalId);
		return result;
	}; 
	
	//즐겨찾기 등록
	@Transactional
	@Override
	public void register(FavoriteVO favorite) {
		favoriteMapper.insertFavorite(favorite);
	}; 
	
	//즐겨찾기 삭제
	@Transactional
	@Override
	public void delete(int favoriteNo) {
		favoriteMapper.deleteFavorite(favoriteNo);
	}
	
	//환자용 즐겨찾기
	@Override
	public List<FavoriteVO> selectForUser(String userId){
		return favoriteMapper.getForUser(userId);
	};
	
	//병원용 즐겨찾기
	@Override
	public List<FavoriteVO> selectForHospital(String hospitalId){
		return favoriteMapper.getForHospital(hospitalId);
	};

}
