package com.petcare.web.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.petcare.web.domain.UserVO;
import com.petcare.web.service.MemberService;

@Component
public class MemberValidator implements Validator {

	@Autowired
	private MemberService memberService;
	
	@Override
	public boolean supports(Class<?> clazz) {
		return UserVO.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		
		UserVO newUser = (UserVO) target;
		UserVO savedUser = memberService.getUser(newUser.getUserId());
		UserVO emailUser = memberService.getEmail(newUser.getUserEmail());
		
		//아이디 중복체크
		if(savedUser != null)
		{
			errors.rejectValue("userId", "duplicateId", "이미 존재하는 아이디입니다.");
		}
		
		//이메일 중복체크
		if(emailUser != null)
		{
			errors.rejectValue("userEmail", "duplicateEmail", "이미 존재하는 이메일입니다.");
		}
		
		//비밀번호 확인
		if(!newUser.getUserPw().equals(newUser.getUserPw2())) {
			errors.rejectValue("userPw", "misMatchUserPw", "비밀번호가 서로 일치하지 않습니다.");
		}
	}

}
