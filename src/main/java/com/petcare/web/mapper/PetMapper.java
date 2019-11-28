package com.petcare.web.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.petcare.web.domain.PetVO;
import com.petcare.web.domain.Criteria;

public interface PetMapper {
    
    public void insert(PetVO pet); //동물 등록
    
    public List<PetVO> getList(); //동물 리스트
    
    public List<PetVO> getListWithPaging(@Param("cri") Criteria cri, @Param("userId") String userId); //동물 리스트 페이징
    
    public PetVO read(int petNo); //동물 정보 조회
    
    public int delete(int petNo); //동물정보 삭제
    
    public int update(PetVO pet); //동물 정보 수정
    
    public int getTotalCount(Criteria cri); //전체 글 개수
}
