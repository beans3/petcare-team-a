package com.petcare.web.service;

import java.util.List;

import com.petcare.web.domain.AppointmentVo;
import com.petcare.web.domain.Criteria;
import com.petcare.web.domain.UserVO;

public interface MemberService {
	//회원가입
	public void register(UserVO user);
	//아이디중복체크
	public UserVO getUser(String userId);
	//이메일중복체크
	public UserVO getEmail(String userEmail);
	//로그인
	public UserVO loginPro(UserVO user);
	//개인정보수정
	public UserVO getList(UserVO user);
	//수정
	public void update(UserVO user);
	
	public List<AppointmentVo> getLists(Criteria cri, String userId);
	
	public AppointmentVo get(int apptNo);
	
	public boolean remove(int apptNo);
	
	public boolean modify(AppointmentVo appointment);
	
	public int getTotal(Criteria cri);
}
