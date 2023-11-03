package com.first.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.first.domain.CartItemDTO;
import com.first.domain.CartItemVO;


public interface CartMapper {
	
	public List<CartItemVO> getCartList(String memberId);
	    // 장바구니에 아이템 추가
	    void addItemToCart(CartItemVO cartItem);

	    // 장바구니에서 아이템 조회
	    public List<CartItemDTO> getCartItemsByMemberId(String memberId);
	    
	    //중복 상품 확인용 lid불러오기
	    public List<Integer> getLidbyMemberId(String memberId);
	    
	    //장바구니 수량 조절
	    public void updateCartItem(CartItemVO cartItem);
	    
	    //장바구니 체크한 아이템 삭제
		public void deleteCartItemsByLids(List<Integer> lids);
	   

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