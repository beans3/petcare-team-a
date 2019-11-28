package com.petcare.web.service;

import java.util.List;

import com.petcare.web.domain.PetVO;
import com.petcare.web.domain.Criteria;

public interface PetService {

	public void register(PetVO pet); //동물 등록
	
	//public List<AnimalVo> getList(); //동물 리스트
	
	public List<PetVO> getList(Criteria cri, String userId);
	
	public PetVO get(int petNo); //동물정보 조회
	
	public boolean remove(int petNo); //동물정보 삭제
	
	public boolean modify(PetVO pet); //동물정보 수정
	
	public int getTotal(Criteria cri); // 전체 글 개수
}
