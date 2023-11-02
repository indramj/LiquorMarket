package com.first.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.first.domain.OrderPageDTO;
import com.first.service.MemberService;
import com.first.service.OrderService;

@Controller
public class OrderController {

	@Autowired
	public OrderService orderService;
	
	@Autowired
	private MemberService memberService;
	
	
	
	
	@GetMapping("/order/{memberId}")
	public String orderPgaeGET(@PathVariable("memberId") String memberId, OrderPageDTO opd, Model model) {
		
		model.addAttribute("orderList", orderService.getGoodsInfo(opd.getOrders()));
		model.addAttribute("memberInfo", memberService.getMemberInfo(memberId));
		return "/order";
	}
	}

