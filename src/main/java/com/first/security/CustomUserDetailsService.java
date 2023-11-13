package com.first.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.first.domain.CustomUser;
import com.first.domain.MemberVO;
import com.first.mapper.MemberMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService {

	@Setter(onMethod_ = @Autowired)
	private MemberMapper memberMapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		log.warn("Load User By UserName: " + username);
		
		MemberVO vo = memberMapper.getMemberWithAuth(username);
		
		log.warn("queried by member mapper: " + vo);
		if(vo == null)
			return null;
		else
		{
			CustomUser user = new CustomUser(vo);
			return user;
		}

	}

}
