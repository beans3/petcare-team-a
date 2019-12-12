package com.petcare.web.domain;

import lombok.Data;

/*
 * treatment 테이블과 매핑되는 vo
 * 
 */

@Data
public class MedicalRecordVO {
	//진료차트시퀀스
	private int treatNo;
	//애완동물 번호
	private int petNo;
	//병원아이디
	private String hospitalId;
	//내용
	private String treatContent;
	//진료일자
	private String treatRegdate;
}
