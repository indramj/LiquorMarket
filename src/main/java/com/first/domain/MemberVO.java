package com.first.domain;

import java.util.Date;
import java.util.List;

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

	
	private Date regDate;
	
	private Date updateDate;
	
	List<AuthVO> authList;
	
	
	
	
}
