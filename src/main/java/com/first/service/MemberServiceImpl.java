package com.first.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.first.domain.MemberVO;
import com.first.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	MemberMapper membermapper;

	@Override
	public void joinMember(MemberVO member) throws Exception {
		
		membermapper.joinMember(member);
	}


	@Override
	public int checkId(String memberId) throws Exception {
		
		return membermapper.checkId(memberId);
	}

	@Override
    public MemberVO loginMember(MemberVO member) throws Exception {
        
        return membermapper.loginMember(member);
    }

    
}
