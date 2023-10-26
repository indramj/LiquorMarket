package com.first.controller;


import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.first.domain.Criteria;
import com.first.domain.LiquorVO;
import com.first.domain.MemberVO;
import com.first.domain.PageDTO;
import com.first.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	
	@GetMapping("/manageMember")
	public void manageMember(Model model)
	{
		List<MemberVO> memberList = adminService.getMemberList();
		model.addAttribute("memberList" , memberList);
	}
	
	
	

}

