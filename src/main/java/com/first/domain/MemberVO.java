package com.first.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {
	
	//회원 id
	private String memberId;
	
	//회원 비밀번호
	private String memberPw;
	
	//회원 이름
	private String memberName;
	
	//회원 이메일
	private String memberEmail;
	
	//회원 전화번호
	private String memberPhone;
	
	//회원 상세주소
	private String memberAddress;
	
	//등록일자
	private Date regDate;
	
	private Date updateDate;
	
	
}
