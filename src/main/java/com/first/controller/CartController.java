package com.first.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.first.domain.CartItemDTO;
import com.first.domain.CartItemVO;
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
	CartService cartService;
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("")
	public void cartPageGET(Principal principal , Model model) {
		
		log.info("cart/memberId");
		String memberId = principal.getName();
		List<CartItemDTO> cartList = cartService.getCartList(memberId);
		model.addAttribute("cartList" , cartList);
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/addItem")
	@ResponseBody
	public ResponseEntity<String> addItemToCart(@RequestBody CartItemVO cartItem ,Principal principal) {
		log.info("cart/addItem");

			String memberId = principal.getName();
			cartItem.setMemberId(memberId);
		    cartService.addItemToCart(cartItem);
		    return new ResponseEntity<String>("success" , HttpStatus.OK);
		
	}
	
	@PutMapping("/updateQty")
	@ResponseBody
	public ResponseEntity<String> updateQty(@RequestBody CartItemVO cartItem , Principal principal)
	{
		log.info("updateCartItem");
		cartItem.setMemberId(principal.getName());
		cartService.updateCartItem(cartItem);
		return new ResponseEntity<String>("result", HttpStatus.OK);
	}

	@GetMapping("/delete")
	public String deleteItemFromCart(@RequestParam("cartCheckList") List<String> cartCheckList , Principal principal) {
		String memberId = principal.getName();
		for (String string : cartCheckList) {
			log.info(string + memberId);
		}
		cartService.deleteCartItems(cartCheckList , memberId);
		
        return "redirect:/cart?memberId=";
	 }
	
	@PostMapping("/checkAuthorize")
	public ResponseEntity<String> checkAuthorize(Authentication authentication){
		if (authentication != null && authentication.isAuthenticated() == true )
			return new ResponseEntity<String>("success" , HttpStatus.OK);
		else
			return new ResponseEntity<String>("error" , HttpStatus.BAD_REQUEST);
	}

}