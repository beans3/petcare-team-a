package com.petcare.web.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.petcare.web.domain.FavoriteVO;

public interface FavoriteMapper {
    
	public String checkFavorite(@Param("userId") String userId, @Param("hospitalId")String hospitalId); //즐겨찾기 체크
    public void insertFavorite(FavoriteVO favorite); //즐겨찾기 등록
    public void deleteFavorite(int favoriteNo); //즐겨찾기 삭제
    public List<FavoriteVO> getForUser(String userId); //유저용 즐겨찾기
    public List<FavoriteVO> getForHospital(String hospitalId); //병원용 즐겨찾기
    
}
