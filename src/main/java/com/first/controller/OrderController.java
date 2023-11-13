package com.first.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.first.domain.CartItemDTO;
import com.first.domain.CartItemVO;
import com.first.domain.MemberVO;
import com.first.domain.OrderPageDTO;
import com.first.service.CartService;
import com.first.service.MemberService;
import com.first.service.OrderService;

@Controller
@RequestMapping("/order")
public class OrderController {

	@Autowired
	public OrderService orderService;
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private CartService cartService;
	
	
	
	@GetMapping("/orderList")
	public void orderCartItem(Principal principal, Model model , @RequestParam("totalCartPrice") String totalCartPrice) {
		
		String memberId = principal.getName();
		List<CartItemDTO> cartList = cartService.getCartList(memberId);
		MemberVO member = memberService.getMemberInfo(memberId);
		model.addAttribute("totalCartPrice" ,totalCartPrice);
		model.addAttribute("cartList" , cartList);
		model.addAttribute("memberInfo" , member);
		
	}
	
	@PostMapping("/confirm")
	public void orderConfirm(Principal principal)
	{
		String memberId = principal.getName();
		cartService.orderConfirm(memberId);
	}
}

