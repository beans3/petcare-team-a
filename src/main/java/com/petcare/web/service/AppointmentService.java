package com.petcare.web.service;

import java.util.List;

import com.petcare.web.domain.AppointmentVo;
import com.petcare.web.domain.Criteria;

public interface AppointmentService {

	public List<AppointmentVo> getList(Criteria cri, String hospitalId);
	
	public AppointmentVo get(int apptNo);
	
	public boolean remove(int apptNo);
	
	public boolean modify(AppointmentVo appointment);
	
	public int getTotal(Criteria cri);
}
