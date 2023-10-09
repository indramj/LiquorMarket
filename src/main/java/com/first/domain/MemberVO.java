package com.first.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {
	
	private String memberId;
	
	private String memberPw;
	
	private String memberName;
	
	private String memberPhone;
	
	private String memberEmail;
	
	private String memberAddress1;
	
	private String memberAddress2;
	
	// 관리자 구분(0:일반사용자, 1:관리자)
	private int adminCk;
	
	private Date regDate;
	
	private Date updateDate;
	
	
	
}
