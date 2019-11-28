package com.petcare.web.domain;

import java.util.Date;

import lombok.Data;

//예약vo
@Data
public class AppointmentVo {

	private int apptNo;//예약번호
	private int petNo;//펫번호
	private String userId;//유저아이디
	private String hospitalId;//병원아이디
	private Date apptDate;//예약날짜
	private Date apptTime;//예약시간
	private String apptNote;//참고사항
	private int apptStatus;//예약상태
	private String petName; //펫이름
	private String userPhone; //전화번호
	private String hospitalName; //병원이름
}
