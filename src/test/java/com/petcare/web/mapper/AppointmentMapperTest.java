package com.petcare.web.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.petcare.web.config.RootConfig;
import com.petcare.web.domain.AppointmentVo;
import com.petcare.web.domain.Criteria;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = RootConfig.class)
@WebAppConfiguration
public class AppointmentMapperTest {

	@Autowired
	private AppointmentMapper mapper;
	
//	@Test
//	public void listTest() {
//		Criteria cri = new Criteria();
//		
//		cri.setPageNum(1);
//		cri.setAmount(10);
//		
//		List<AppointmentVo> list = mapper.getList(cri, "namsss");
//		
//	}
	
//	@Test
//	public void readTest() {
//		AppointmentVo appointmentVo = mapper.read(1);
//	}
	
//	@Test
//	public void deleteTest() {
//		AppointmentVo appt = new AppointmentVo();
//		
//		mapper.delete(4);
//	}
	
//	@Test
//	public void updateTest() {
//		AppointmentVo appt = mapper.read(1);
//		
//		appt.setApptStatus(0);
//		
//		mapper.update(appt);
//	}
}
