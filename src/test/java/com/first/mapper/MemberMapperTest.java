package com.first.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.first.domain.MemberVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@Log4j
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MemberMapperTest {

	@Autowired
	private MemberMapper membermapper;
	
	
	/*회원가입 테스트*/
	/*
	@Test
	public void joinMember() throws Exception{
		MemberVO member = new MemberVO();
		
		member.setMemberId("tID");
		member.setMemberPw("tPW");
		member.setMemberName("tNAME");
		member.setMemberPhone("tPHONE");
		member.setMemberEmail("tEMAIL");
		member.setMemberAddress1("tADDRESS1");
		member.setMemberAddress2("tADDRESS2");
		
		membermapper.joinMember(member);	
	}
	*/
	
	
	/*아이디 중복검사 테스트*/
	/*
	@Test
	public void memberIdChk() throws Exception{
		String id = "test333";
		String id2 = "test12214243";
		membermapper.checkId(id);
		membermapper.checkId(id2);
	}
	*/
	
	
	/* 로그인 메서드 테스트 */
	/*
    @Test
    public void loginMember() throws Exception{
        
        MemberVO member = new MemberVO();    // MemberVO 변수 선언 및 초기화
        
        // 올바른 아이디 비번 입력경우
        member.setMemberId("ttid");
        member.setMemberPw("ttpw");
        
        // 올바른 않은 아이디 비번 입력경우 
        //member.setMemberId("ttid");
        //member.setMemberPw("test1321321");
        
        membermapper.loginMember(member);
        System.out.println("결과 값 : " + membermapper.loginMember(member));
    }
	*/
	
//	@Test
//	public void getMemberById()
//	{
//		
//		log.info(membermapper.getMember("kmm"));
//	}
	
}