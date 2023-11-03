package com.first.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	@GetMapping("")
	public void cartPageGET(@RequestParam("memberId") String memberId , Model model) {
		
		log.info("cart/memberId");
		List<CartItemDTO> cartList = cartService.getCartList(memberId);
		model.addAttribute("cartList" , cartList);
	}
	
	@PostMapping("/addItem")
	@ResponseBody
	public ResponseEntity<String> addItemToCart(@RequestBody CartItemVO cartItem) {
		log.info("cart/addItem");
		
	    cartService.addItemToCart(cartItem);
	    
	    return new ResponseEntity<String>("success" , HttpStatus.OK);
	}
	
	@PutMapping("/updateQty")
	@ResponseBody
	public ResponseEntity<String> updateQty(@RequestParam CartItemVO cartItem)
	{
		log.info("updateCartItem");
		cartService.updateCartItem(cartItem);
		return new ResponseEntity<String>("result" , HttpStatus.OK);
	}
	
	@PostMapping("/delete")
    public ResponseEntity<String> deleteSelectedItems(@RequestParam("lids") List<Integer> lids) {
        try {
            // 선택된 물품 삭제
            cartService.deleteCartItems(lids);
            return ResponseEntity.ok("Items deleted successfully");
        } catch (Exception e) {
            // 오류가 발생한 경우
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to delete items");
        }
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