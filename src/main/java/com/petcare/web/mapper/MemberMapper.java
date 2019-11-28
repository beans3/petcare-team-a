package com.petcare.web.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.petcare.web.domain.AppointmentVo;
import com.petcare.web.domain.Criteria;
import com.petcare.web.domain.UserVO;

public interface MemberMapper {
	public void register(UserVO user);	//회원가입
	public UserVO getUser(String userId); //아이디 중복체크(Spring Validator)
	public UserVO getEmail(String userEmail); //이메일 중복체크(Spring Validator)
	public UserVO loginPro(UserVO user); 	//로그인
	public UserVO getList(UserVO user);		//개인정보수정
	public void update(UserVO user); //수정
	
	public List<AppointmentVo> getAppointmentList(@Param("cri") Criteria cri, @Param("userId") String userId);
	
	public AppointmentVo readAppointment(int apptNo);
	
	public int updateAppointment(AppointmentVo appointment);
	
	public int deleteAppointment(int apptNo);
	
	public int getTotalCount(Criteria cri);
}
