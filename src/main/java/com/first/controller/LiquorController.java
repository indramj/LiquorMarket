package com.first.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.first.domain.LiquorVO;
import com.first.service.LiquorService;

@Controller
public class LiquorController {
	
	@Autowired
	LiquorService liquorService;
	
	@GetMapping("/liquor/liquorList")
	public void list(Model model)
	{
		List<LiquorVO> liquorList = liquorService.getLiquorList();
		model.addAttribute("liquorList" , liquorList);
	}
	
	@GetMapping("/liquor/read")
	public void read(@RequestParam("lid") int lid , Model model)
	{
		LiquorVO liquor = new LiquorVO();
		liquor = liquorService.getLiquor(lid);
		model.addAttribute("liquor" , liquor);
	}

}
