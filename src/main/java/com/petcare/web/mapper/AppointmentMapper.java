package com.petcare.web.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.petcare.web.domain.AppointmentVo;
import com.petcare.web.domain.Criteria;

public interface AppointmentMapper {

	public List<AppointmentVo> getList(@Param("cri") Criteria cri, @Param("hospitalId") String hospitalId);
	
	public AppointmentVo read(int apptNo);
	
	public int update(AppointmentVo appointment);
	
	public int delete(int apptNo);
	
	public int getTotalCount(Criteria cri);
}
