package com.first.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.first.domain.CartDTO;
import com.first.domain.MemberVO;
import com.first.service.CartService;

import oracle.jdbc.proxy.annotation.Post;

@Controller
public class CartController {
	
	@Autowired
	private CartService cartService;
	
	@PostMapping("/cart/{lib}")
	@ResponseBody
	public String addCartPOST(CartDTO cart) {
		int result = cartService.addCart(cart);
		
		return result + "";
	}
	
	@GetMapping("/cart/{lib}")
	public String cartPageGET(@PathVariable("lib") String lib, Model model) {
		
		model.addAttribute("cartInfo", cartService.getCartList(lib));
		
		return "/cart";
	}
	
	// 어디가 문제인거지
}