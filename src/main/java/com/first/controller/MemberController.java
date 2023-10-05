package com.first.controller;

import lombok.extern.log4j.Log4j;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
	@Autowired
    private BCryptPasswordEncoder pwEncoder;
	
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
	@PostMapping("/join")
	public String postJoin(MemberVO member) throws Exception{
		
		String rawPw = "";
        String encodePw = "";
        
        rawPw = member.getMemberPw();
        encodePw = pwEncoder.encode(rawPw);
        member.setMemberPw(encodePw);
        
        /* 회원가입 쿼리 실행 */
        memberservice.joinMember(member);
		
		return "redirect:../";
	}
	
	//아이디 중복 검사
		@PostMapping("/memberIdChk")
		@ResponseBody
		public String postMemberIdChk(String memberId) throws Exception{
			
			log.info("memberIdChk() 진입");
			
			int result = memberservice.checkId(memberId);
			
			log.info("결과값 = " + result);
			if(result != 0) {
				return "fail";
			} else {
				return "success";
			}
			
		} // postMemberIdChk() 종료	
		
		/* 이메일 인증 */
	    @GetMapping("/mailCheck")
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
	    
	    //로그인
	    @PostMapping("login")
	    public String postLogin(HttpServletRequest request, MemberVO member, RedirectAttributes rttr) throws Exception{
	        
	    	HttpSession session = request.getSession();
	        String rawPw = "";
	        String encodePw = "";
	    
	        MemberVO lvo = memberservice.loginMember(member); 
	        
	        if(lvo != null) {
	            
	            rawPw = member.getMemberPw();
	            encodePw = lvo.getMemberPw();
	            
	            if(true == pwEncoder.matches(rawPw, encodePw)) {
	                
	                lvo.setMemberPw("");
	                session.setAttribute("member", lvo);
	                return "redirect:../";
	                
	                
	            } else {
	 
	                rttr.addFlashAttribute("result", 0);            
	                return "redirect:/member/login";
	                
	            }
	            
	        } else {
	            
	            rttr.addFlashAttribute("result", 0);            
	            return "redirect:/member/login";
	            
	        }
	    	
	    }
	    
	    /* 메인페이지 로그아웃 */
	    @GetMapping("logout.do")
	    public String getLogoutMain(HttpServletRequest request) throws Exception{
	        
	    	log.info("getLogoutMain메서드 진입");
	        
	        HttpSession session = request.getSession();
	        
	        session.invalidate();
	        
	        return "redirect:../";
	    	
	    }
	    
	    //마이페이지 이동
	    @GetMapping("/mypage")
		public void getMyPage() {
		
	    	log.info("마이페이지 진입");
		}
	    
}
