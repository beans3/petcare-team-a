package com.petcare.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petcare.web.domain.AppointmentVo;
import com.petcare.web.domain.Criteria;
import com.petcare.web.domain.MedicalRecordVO;
import com.petcare.web.mapper.MedicalRecordMapper;

@Service
public class MedicalRecordService {
	
	@Autowired
	MedicalRecordMapper medicalRecordMapper;

	public int insertMedicalRc(MedicalRecordVO medicalRecordVO) {
		
		return medicalRecordMapper.insertMedicalRc(medicalRecordVO);
	}

	public AppointmentVo getApptInfo(int apptNo) {
		
		return medicalRecordMapper.getApptInfo(apptNo);
	}

	public List<MedicalRecordVO> getRcList(String hospitalId) {
		// TODO Auto-generated method stub
		return medicalRecordMapper.getRcList(hospitalId);
	}

	public int updateMedicalRc(int apptNo) {
		return medicalRecordMapper.updateMedicalRc(apptNo);
	}

	public int getTotal(Criteria cri) {
		// TODO Auto-generated method stub
		return medicalRecordMapper.getTotalCount(cri);
	}
}
