package com.first.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import com.first.domain.LiquorVO;
import com.first.service.LiquorService;


@Controller
@RequestMapping("/")
public class MainController {
	
	@Autowired
	LiquorService service;
	
	@GetMapping("")
	public String main(Model model)	
	{
		List<LiquorVO> liquorList =	service.getLiquorList();
		model.addAttribute("liquorList" , liquorList);
		return "mainhome";
	}
	
}
