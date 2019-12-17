package com.petcare.web.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.petcare.web.domain.Hospital;
import com.petcare.web.service.HospitalService;

@Component
public class HospitalValidator implements Validator {

	@Autowired
	private HospitalService hospitalservice;
	
	@Override
	public boolean supports(Class<?> clazz) {
		return Hospital.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		
		Hospital newhospital = (Hospital) target;
		Hospital savedhospital = hospitalservice.getId(newhospital.getHospitalId());
		Hospital emailUser = hospitalservice.getEmail(newhospital.getHospitalEmail());
		
		//아이디 중복체크
		if(savedhospital != null)
		{
			errors.rejectValue("hospitalId", "duplicateId", "이미 존재하는 아이디입니다.");
		}
		
		//이메일 중복체크
		if(emailUser != null)
		{
			errors.rejectValue("hospitalEmail", "duplicateEmail", "이미 존재하는 이메일입니다.");
		}
		
		//비밀번호 확인
		if(!newhospital.getHospitalPw().equals(newhospital.getHospitalPw2())) {
			errors.rejectValue("hospitalPw", "misMatchUserPw", "비밀번호가 서로 일치하지 않습니다.");
		}
	}

}
