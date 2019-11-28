package com.petcare.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petcare.web.domain.AppointmentVo;
import com.petcare.web.domain.Criteria;
import com.petcare.web.mapper.AppointmentMapper;

@Service
public class AppointmentServiceImpl implements AppointmentService{

	@Autowired
	private AppointmentMapper mapper;

	@Override
	public List<AppointmentVo> getList(Criteria cri, String hospitalId) {
		return mapper.getList(cri, hospitalId);
	}

	@Override
	public AppointmentVo get(int apptNo) {
		return mapper.read(apptNo);
	}

	@Override
	public boolean remove(int apptNo) {
		return mapper.delete(apptNo) == 1;
	}

	@Override
	public boolean modify(AppointmentVo appointment) {
		return mapper.update(appointment) == 1;
	}

	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}
}
