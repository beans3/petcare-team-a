package com.petcare.web.domain;

import java.util.Date;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import org.springframework.web.multipart.MultipartFile;

import lombok.*;

@Data
public class Hospital {

	@NotEmpty(message = "ID를 입력하세요.")
	@Size(min = 5, max = 10, message = "ID는 5 ~ 10글자이어야 합니다.")
	private String hospitalId;

	private String hospitalPw;
	
	private String hospitalPw2;
	
	private String hospitalName;
	
	private String hospitalAddress;
	
	private String hospitalPhone;
	
	private String hospitalEmail;
	
	private String hospitalOpen;
	
	private String hospitalClose;
	
	private String hospitalSpecies;
	
	private MultipartFile hospitalPhoto;
		
	private String hospitalIntro;
	
	private Date hospitalJoindate;
	
}
