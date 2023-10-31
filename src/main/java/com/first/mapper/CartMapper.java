package com.first.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.first.domain.CartItemDTO;
import com.first.domain.CartItemVO;


public interface CartMapper {
	
	public List<CartItemVO> getCartList(String memberId);
	    // 장바구니에 아이템 추가
	    void addItemToCart(@Param("memberId") String memberId, @Param("lid") int lid, @Param("price") int price);

	    // 장바구니에서 아이템 조회
	    List<CartItemDTO> getCartItemsByMemberId(String memberId);
	   

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