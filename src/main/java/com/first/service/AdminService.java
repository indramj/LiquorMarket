package com.first.service;

import java.util.List;


import com.first.domain.Criteria;
import com.first.domain.MemberVO;

public interface AdminService {
	
	public List<MemberVO> getMemberList();
	
	public void addRole(List<String> memberList);
	
	public void removeRole(List<String> memberList);

	public void removeMember(List<String> memberList);
}
