package com.first.mapper;

import com.first.domain.MemberVO;

public interface MemberMapper {
	
	public void joinMember(MemberVO memberVO);
	
	public int idCheck(String memberId);
	


}
