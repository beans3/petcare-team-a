package com.petcare.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petcare.web.domain.MedicalRecordVO;
import com.petcare.web.mapper.MedicalRecordMapper;

@Service
public class MedicalRecordService {
	
	@Autowired
	MedicalRecordMapper medicalRecordMapper;

	public int insertMedicalRc(MedicalRecordVO medicalRecordVO) {
		
		return medicalRecordMapper.insertMedicalRc(medicalRecordVO);
	}

}
