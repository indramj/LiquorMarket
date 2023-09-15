package com.first.controller;

import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Log4j
@Controller
@RequestMapping(value = "/member")
public class MemberController {
	
	//로그인 페이지 이동
	@GetMapping("/login")
	public void GETlogin() {
		
		log.info("로그인 페이지 진입");
	}
	//회원가입 페이지 이동
	@GetMapping("/join")
	public void GETjoin() {
		
		log.info("회원가입 페이지 진입");
	}

}
