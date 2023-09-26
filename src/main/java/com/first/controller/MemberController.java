package com.first.controller;

import lombok.extern.log4j.Log4j;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.first.domain.MemberVO;
import com.first.service.MemberService;

@Log4j
@Controller
@RequestMapping(value = "/member")
public class MemberController {
	
	@Autowired
	private MemberService memberservice;
	
	@Autowired
    private JavaMailSender mailSender;
	
	//로그인 페이지 이동
	@GetMapping("/login")
	public void getLogin() {
		
		log.info("로그인 페이지 진입");
	}
	//회원가입 페이지 이동
	@GetMapping("/join")
	public void getJoin() {
		
		log.info("회원가입 페이지 진입");
	}
	//회원가입
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String joinPOST(MemberVO member) throws Exception{
		
		log.info("join 진입");
		
		//회원가입 실행
		memberservice.joinMember(member);
		
		log.info("join Service 성공");
		
		return "redirect:/mainhome";
	}
	
	//아이디 중복 검사
		@RequestMapping(value = "/memberIdChk", method = RequestMethod.POST)
		@ResponseBody
		public String memberIdChkPOST(String memberId) throws Exception{
			
			log.info("memberIdChk() 진입");
			
			int result = memberservice.checkId(memberId);
			
			log.info("결과값 = " + result);
			if(result != 0) {
				return "fail";
			} else {
				return "success";
			}
			
		} // memberIdChkPOST() 종료	
		
		/* 이메일 인증 */
	    @RequestMapping(value="/mailCheck", method=RequestMethod.GET)
	    @ResponseBody
	    public String getMailCheck(String email) throws Exception{
	        
	    /* 뷰(View)로부터 넘어온 데이터 확인 */
	    log.info("이메일 데이터 전송 확인");
	    log.info("인증번호 : " + email);
	        
	    /* 인증번호(난수) 생성 */
	    Random random = new Random();
	    int checkNum = random.nextInt(888888) + 111111;
	    log.info("인증번호 " + checkNum);
	        
	    /* 이메일 보내기 */
	    String setFrom = "shleeeeeee2@gmail.com";
	    String toMail = email;
	    String title = "회원가입 인증 이메일 입니다.";
	    String content = 
	            "홈페이지를 방문해주셔서 감사합니다." +
	            "<br><br>" + 
	            "인증 번호는 " + checkNum + "입니다." + 
	            "<br>" + 
	            "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
	    
	    try {
            
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        }
	    
	    String num = Integer.toString(checkNum);
	    
	    return num;
	    
	    }
	    
	    /* 로그인 */
	    @RequestMapping(value="login", method=RequestMethod.POST)
	    public String loginPOST(HttpServletRequest request, MemberVO member, RedirectAttributes rttr) throws Exception{
	        
	        //System.out.println("login 메서드 진입");
	        //System.out.println("전달된 데이터 : " + member);
	        
	    	HttpSession session = request.getSession();
	    	MemberVO lvo = memberservice.loginMember(member);
	    	
	    	if(lvo == null) {
	            
	            int result = 0;
	            rttr.addFlashAttribute("result", result);
	            return "redirect:/member/login";
	            
	        }
	        
	        session.setAttribute("member", lvo);
	        
	        return "redirect:/mainhome";
	    	
	    }
}
