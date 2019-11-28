package com.petcare.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petcare.web.domain.PetVO;
import com.petcare.web.domain.Criteria;
import com.petcare.web.mapper.PetMapper;

import lombok.extern.log4j.Log4j;

@Service
public class PetServiceImpl implements PetService{
	
	@Autowired
	private PetMapper mapper;

	//동물 등록
	@Override
	public void register(PetVO pet) {
		mapper.insert(pet);
	}

	//동물 리스트
	@Override
	public List<PetVO> getList(Criteria cri, String userId) {
		return mapper.getListWithPaging(cri, userId);
	}

	//동물 정보 조회
	@Override
	public PetVO get(int petNo) {
		return mapper.read(petNo);
	}

	//동물 정보 삭제
	@Override
	public boolean remove(int petNo) {
		return mapper.delete(petNo) == 1;
	}

	//동물 정보 수정
	@Override
	public boolean modify(PetVO pet) {
		return mapper.update(pet) == 1;
	}

	//전체 글 개수
	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}
	
}
