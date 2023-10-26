package com.first.mapper;

public interface AuthMapper {
	
	//최초 가입시 ROLE_USER권한 부여
	public void join(String memberId);
	
	//운영자 권한 부여
	public void addRole(String memberId);

}
