package com.first.mapper;

import java.util.List;

import com.first.domain.MemberVO;

public interface MemberMapper {

	public void joinMember(MemberVO memberVO);

	public int checkId(String memberId);

	public MemberVO getMemberWithAuth(String memberId);
	
	public List<MemberVO> getMemberList();
	
	public void remove(String memberId);

	/* 주문자 주소 정보 */
	public MemberVO getMemberInfo(String memberId);
}
