package com.petcare.web.mapper;

import java.util.List;

import com.petcare.web.domain.AppointmentVo;
import com.petcare.web.domain.Criteria;
import com.petcare.web.domain.MedicalRecordVO;

public interface MedicalRecordMapper {

	//진료기록 작성
	int insertMedicalRc(MedicalRecordVO medicalRecordVO);

	//기록 작성 전 예약자 정보 갖고오기
	AppointmentVo getApptInfo(int apptNo);

	List<MedicalRecordVO> getRcList(String hospitalId);

	int updateMedicalRc(int apptNo);

	int getTotalCount(Criteria cri);

}
