package com.first.mapper;

import java.util.List;

import com.first.domain.CartDTO;

public interface CartMapper {
	
	public int addCart(CartDTO cart) throws Exception;
	
	
	public int deleteCart(int cartId);
	
	
	public int modifyCount(CartDTO cart);
	
	
	public List<CartDTO> getCart(String memberId);	
	
	// 카트 확인
	public CartDTO checkCart(CartDTO cart);
}
