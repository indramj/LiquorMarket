package com.first.service;

import java.util.List;

import	com.first.domain.CartDTO;

public interface CartService {
	
	public int addCart(CartDTO cart);
	
	
	public List<CartDTO> getCartList(String memberId);
	
	
}
