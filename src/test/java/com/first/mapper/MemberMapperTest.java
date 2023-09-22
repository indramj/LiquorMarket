package com.first.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.first.domain.MemberVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MemberMapperTest {

	@Autowired
	private MemberMapper membermapper;
	
	/*
	//회원가입 테스트
	@Test
	public void memberJoin() throws Exception{
		MemberVO member = new MemberVO();
		
		member.setMemberId("tID");
		member.setMemberPw("tPW");
		member.setMemberName("tNAME");
		member.setMemberEmail("tEMAIL");
		member.setMemberPhone("tPHONE");
		member.setMemberAddress("tADDRESS");
		
		membermapper.memberJoin(member);	
	}
	*/
	
	//아이디 중복검사 테스트
		@Test
		public void memberIdChk() throws Exception{
			String id = "test333";
			String id2 = "test12214243";
			membermapper.idCheck(id);
			membermapper.idCheck(id2);
		}

}