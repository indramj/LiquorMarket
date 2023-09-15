package com.first.controller;

import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Log4j
@Controller
public class MainController {
	
	//메인 페이지 이동
	@GetMapping("/mainhome")
	public void getMainHome() {
			
		log.info("메인 페이지 진입");
		
		}

}
