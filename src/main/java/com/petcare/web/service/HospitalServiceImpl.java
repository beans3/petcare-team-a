package com.petcare.web.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.petcare.web.domain.Codename;
import com.petcare.web.domain.Hospital;
import com.petcare.web.mapper.HospitalMapper;

@Service
public class HospitalServiceImpl implements HospitalService {
	@Autowired
	private HospitalMapper hospitalMapper;
	
	//코드네임 불러오기
	@Override
	public List<String> codename(String hospitalId){
		List<String> result = hospitalMapper.listCodename(hospitalId);
		return result;
	}
	
	//병원 전체 리스트
	@Override
	public List<Hospital> list(){
		List<Hospital> result = hospitalMapper.listHospital();
		return result;
	};
	
	//병원 이름 검색
	@Override
	public List<Hospital> searchName(String hospitalName){
		List<Hospital> result = hospitalMapper.searchHospitalByName(hospitalName);
		return result;
	};
	
	//병원 주소 검색
	@Override
	public List<Hospital> searchAddress(String hospitalAddress){
		List<Hospital> result = hospitalMapper.searchHospitalByAddress(hospitalAddress);
		return result;
	};
	
	//병원 보기
	@Override
	public Hospital view(String hospitalId) {
		Hospital result = hospitalMapper.viewHospital(hospitalId);
		return result;
	}

	//병원 회원가입
	@Transactional
	@Override
	public void register(Hospital hospital) {
		hospitalMapper.register(hospital);
	}
	
	//특성 삽입
	@Override
	public void codeInsert(Codename codename) {
		hospitalMapper.codeInsert(codename);
	}

	@Override
	public int selectID(String id) {
		String hospitalId = hospitalMapper.selectID(id);
		if(hospitalId == null) {
			return 0;
		}else {
			return 1;
		}
	}

	@Override
	public int selectEmail(String email) {
		String hospitalEmail = hospitalMapper.selectEmail(email);
		if(hospitalEmail == null) {
			return 0;			
		}else {
			return 1;
		}
	}

	//병원 로그인
	@Override
	public Hospital loginPro2(Hospital hospitaluser) {
		// TODO Auto-generated method stub
		return hospitalMapper.loginPro2(hospitaluser);
	}
	
	//병원 개인정보
	@Override
	public Hospital getList(String hospitalId) {
		Hospital hospital = hospitalMapper.getList(hospitalId);		
		return hospital;
	}
	
	//특성 가져오기
	@Override
	public List<Map<String, String>> getCharacter(String hospitalId) {
		List<Map<String, String>> list = hospitalMapper.getCharacter(hospitalId);
		return list;
	}

	//병원정보 수정하기
	@Transactional
	@Override
	public void modify(Hospital hospital) {
		hospitalMapper.deleteCode(hospital.getHospitalId());
		
		hospitalMapper.update(hospital);
	}
}
