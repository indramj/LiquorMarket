package com.first.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.first.domain.LiquorVO;
import com.first.domain.MemberVO;
import com.first.service.CartService;
import com.first.service.LiquorService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/cart")
public class CartController {
	
	@Autowired
	LiquorService liquorService;
	
	@GetMapping("")
	public void cartPageGET(@RequestParam("lid") int lid , Model model) {
		
		log.info("cart/lid");
		LiquorVO liquorVO = liquorService.getLiquor(lid);
		model.addAttribute("liquor" , liquorVO);
	}
	
//	@Autowired
//	private CartService cartService;
//	
//	@PostMapping("/cart/add")
//	@ResponseBody
//	public int addCartPOST(CartDTO cart, HttpServletRequest request) {
//		
//		/* 뷰는 숫자를 반환받도록 한다. (0: 등록 실패 / 1 : 등록 성공 / 2 : 등록된 데이터 존재 5: 로그인 필요) */
//		
//		// 로그인 체크
//		HttpSession session = request.getSession();
//		MemberVO mvo = (MemberVO)session.getAttribute("member");
//		if(mvo == null) {
//			return "5";
//		}
//		
//		// 카트 등록
//	
//		int result = cartService.addCart(cart);
//		
//		return result + "";
//	}
//
//	@GetMapping("/cart/{memberId}")
//	public String cartPageGET(@PathVariable("memberId") String memberId, Model model) {
//
//		
//		return "/cart";
//	}
}