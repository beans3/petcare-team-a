package com.petcare.web.service;

import java.util.List;
import java.util.Map;

import com.petcare.web.domain.Codename;
import com.petcare.web.domain.Hospital;

public interface HospitalService {
	//코드네임 불러오기
	public List<String> codename(String hospitalId);
	//병원 전체 리스트
	public List<Hospital> list();
	//병원 이름 검색
	public List<Hospital> searchName(String hospitalName);
	//병원 주소 검색
	public List<Hospital> searchAddress(String hospitalAddress);
	//병원 보기
	public Hospital view(String hospitalId);
	//병원 회원가입
	public void register(Hospital hospital);
	//특성 삽입
	public void codeInsert (Codename codename);
	//아이디중복체크
	public int selectID(String id);
	//이메일중복체크
	public int selectEmail(String email);
	//병원회원 로그인
	public Hospital loginPro2(Hospital hospitaluser);
	//병원개인정보
	public Hospital getList(String hospitalId);
	//특성 가져오기
	public List<Map<String, String>> getCharacter(String hospitalId);
	//병원정보수정하기
	public void modify(Hospital hospital);
}
