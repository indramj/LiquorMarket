package com.first.mapper;

import java.util.List;

import com.first.domain.CartItemVO;


public interface CartMapper {
	
	public List<CartItemVO> getCartList(String memberId);
	
//	public void addCart(CartDTO cart);
//	
//	
//	public int deleteCart(int cartId);
//	
//	
//	public int modifyCount(CartDTO cart);
//	
//	
//	public List<CartDTO> getCart(String memberId);	
//	
//	// 카트 확인
//	public CartDTO checkCart(CartDTO cart);
}
