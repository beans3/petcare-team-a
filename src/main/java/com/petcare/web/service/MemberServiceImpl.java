package com.petcare.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.petcare.web.domain.AppointmentVo;
import com.petcare.web.domain.Criteria;
import com.petcare.web.domain.UserVO;
import com.petcare.web.mapper.MemberMapper;


@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberMapper memberMapper;
	
	//회원가입
	@Transactional
	@Override
	public void register(UserVO user) {
		memberMapper.register(user);
	}
	
	//아이디 중복체크
	@Override
	public UserVO getUser(String userId) {
		return memberMapper.getUser(userId);
	}

	//이메일 중복체크
	@Override
	public UserVO getEmail(String userEmail) {
		return memberMapper.getEmail(userEmail);
	}
	
	//로그인 처리
	@Override
	public UserVO loginPro(UserVO user) {
		return memberMapper.loginPro(user);
	}
	
	//개인정보수정
	@Override
	public UserVO getList(UserVO user) {
		return memberMapper.getList(user);
	}
	
	//수정
	@Override
	public void update(UserVO user) {
		memberMapper.update(user);
	}

	@Override
	public List<AppointmentVo> getLists(Criteria cri, String userId) {
		return memberMapper.getAppointmentList(cri, userId);
	}

	@Override
	public AppointmentVo get(int apptNo) {
		return memberMapper.readAppointment(apptNo);
	}

	@Override
	public boolean remove(int apptNo) {
		return memberMapper.deleteAppointment(apptNo) == 1;
	}

	@Override
	public boolean modify(AppointmentVo appointment) {
		return memberMapper.updateAppointment(appointment) == 1;
	}

	@Override
	public int getTotal(Criteria cri) {
		return memberMapper.getTotalCount(cri);
	}
	
}
