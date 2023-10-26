package com.first.mapper;

import java.util.List;

import com.first.domain.MemberVO;

public interface MemberMapper {

	public void joinMember(MemberVO memberVO);

	public int checkId(String memberId);

	public MemberVO getMember(String memberId);
	
	public List<MemberVO> getMemberList();

}
