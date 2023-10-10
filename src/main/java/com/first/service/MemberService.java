package com.first.service;

import com.first.domain.MemberVO;

public interface MemberService {
	
	
	
	//회원가입
	public void joinMember(MemberVO member) throws Exception;
	

	//아이디 중복확인
	public int checkId(String memberId) throws Exception;
		

	//로그인
	public MemberVO getMember(String memberId);
	
	public String checkEmail(String email);

}
	
	