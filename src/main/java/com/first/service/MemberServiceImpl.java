package com.first.service;

import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.first.domain.MemberVO;
import com.first.mapper.AuthMapper;
import com.first.mapper.MemberMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class MemberServiceImpl implements MemberService{

	@Autowired
	MemberMapper membermapper;
	
	@Autowired
	AuthMapper authMapper;
	
	@Autowired
	JavaMailSender mailSender;
	
	
	

	@Override
	@Transactional
	public void joinMember(MemberVO member) throws Exception {
		
		membermapper.joinMember(member);
		authMapper.join(member.getMemberId());
	}


	@Override
	public int checkId(String memberId) throws Exception {
		
		return membermapper.checkId(memberId);
	}

	@Override
	public MemberVO getMember(String memberId) {
        
        return membermapper.getMember(memberId);
    }
	
	@Override
	public String checkEmail(String email)
	{
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		log.info("인증번호 " + checkNum);

		/* 이메일 보내기 */
		String setFrom = "shleeeeeee2@gmail.com";
		String toMail = email;
		String title = "회원가입 인증 이메일 입니다.";
		String content = "홈페이지를 방문해주셔서 감사합니다." + "<br><br>" + "인증 번호는 " + checkNum + "입니다." + "<br>"
				+ "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";

		try {

			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);

		} catch (Exception e) {
			e.printStackTrace();
		}

		String num = Integer.toString(checkNum);

		return num;

	}

    
}
