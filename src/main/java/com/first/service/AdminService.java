package com.first.service;

import java.util.List;


import com.first.domain.Criteria;
import com.first.domain.MemberVO;

public interface AdminService {
	
	public List<MemberVO> getMemberList();
	
	public void addRole(String memberId);

}
