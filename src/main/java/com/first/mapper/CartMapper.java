package com.first.mapper;

import java.util.List;

public class CartMapper {
	public int addCart(CartDTO cart) throws Exception;
	
	public int deleteCart(int cartId);
	
	public int modifyCount(CartDTO cart);
	
	public List<CartDTO> getCart(String memberId);
	
	public CartDTO checkCart(CartDTO cart);
	
}
