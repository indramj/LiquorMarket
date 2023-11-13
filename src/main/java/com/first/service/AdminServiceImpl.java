package com.first.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.first.domain.Criteria;
import com.first.domain.LiquorVO;
import com.first.domain.MemberVO;
import com.first.mapper.AdminMapper;
import com.first.mapper.AuthMapper;
import com.first.mapper.LiquorMapper;
import com.first.mapper.MemberMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	MemberMapper memberMapper;
	
	@Autowired
	AuthMapper authMapper;
	
	@Override
	public List<MemberVO> getMemberList()
	{
		return memberMapper.getMemberList();
	}
	
	@Override
	public void addRole(List<String> memberList)
	{
		for (String memberId : memberList) {
			authMapper.addRole(memberId);
		}
	}
	
	@Override
	public void removeRole(List<String> memberList)
	{
		for (String memberId : memberList) {
			authMapper.removeRole(memberId);
		}
	}
	
	@Transactional
	@Override
	public void removeMember(List<String> memberList)
	{
		for (String memberId : memberList) {
			authMapper.removeAllAuth(memberId);
			memberMapper.remove(memberId);
		}
	}
	

}
