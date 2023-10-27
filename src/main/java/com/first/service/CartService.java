package com.first.service;

import java.util.List;

import com.first.domain.CartItemDTO;




public interface CartService {
	
	public List<CartItemDTO> getCartList(String memberId);
	

	
}
