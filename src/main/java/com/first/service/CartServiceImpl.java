package com.first.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.first.domain.CartDTO;
import com.first.mapper.CartMapper;

@Service
public class CartServiceImpl implements CartService {
	
	@Autowired
	private CartMapper cartMapper;
	
	@Override
	public int addCart(CartDTO cart) {	
		// 장바구니 데이터 체크
				CartDTO checkCart = cartMapper.checkCart(cart);
				
				if(checkCart != null) {
					return 2;
				}
				
				// 장바구니 등록 & 에러 시 0반환
				try {
					return cartMapper.addCart(cart);
				} catch (Exception e) {
					return 0;
				}
	} 
	
	@Override
	public List<CartDTO> getCartList(String lib) {
		List<CartDTO> cart = cartMapper.getCart(lib);
		
		for(CartDTO dto : cart) {
			dto.initSaleTotal();
		}
		
		return cart;
	}
}
