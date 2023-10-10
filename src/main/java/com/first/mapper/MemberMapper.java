package com.first.mapper;

import com.first.domain.MemberVO;

public interface MemberMapper {

	public void joinMember(MemberVO memberVO);

	public int checkId(String memberId);

	public MemberVO getMember(String memberId);

}
