package com.first.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.first.domain.CartItemDTO;
import com.first.domain.CartItemVO;
import com.first.mapper.CartMapper;




public interface CartService {
	
	
	public List<CartItemDTO> getCartList(String memberId);

	public void addItemToCart(CartItemVO cartItem);

	public void deleteCartItems(List<Integer> lids);

	public void updateCartItem(CartItemVO cartItem);

	
}
