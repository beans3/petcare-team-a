package com.petcare.web.service;

import java.util.List;

import com.petcare.web.domain.AppointmentVo;
import com.petcare.web.domain.Criteria;
import com.petcare.web.domain.UserVO;

public interface MemberService {
	//회원가입
	public void register(UserVO user);
	//아이디중복체크(Spring Validator)
	public UserVO getUser(String userId);
	//이메일중복체크(Spring Validator)
	public UserVO getEmail(String userEmail);
	//로그인
	public UserVO loginPro(UserVO user);
	//개인정보가져오기
	public UserVO getList(UserVO user);
	//수정
	public void update(UserVO user);
	
	//아이디 중복체크(Juery Validator)
	public int selectID(String id);
	//이메일중복체크(Juery Validator)
	public int selectEmail(String email);
	
	public List<AppointmentVo> getLists(Criteria cri, String userId);
	
	public AppointmentVo get(int apptNo);
	
	public boolean remove(int apptNo);
	
	public boolean modify(AppointmentVo appointment);
	
	public int getTotal(Criteria cri);
}
