package com.first.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.first.domain.CartItemDTO;
import com.first.domain.CartItemVO;
import com.first.domain.LiquorVO;
import com.first.mapper.CartMapper;
import com.first.mapper.LiquorMapper;

@Service
public class CartServiceImpl implements CartService {
	
	@Autowired
	private CartMapper cartMapper;
	
	@Autowired
	private LiquorMapper liquorMapper;
	
	
	@Override
	@Transactional
	public List<CartItemDTO> getCartList(String memberId)
	{
		List<CartItemDTO> cartList = new ArrayList<CartItemDTO>();
		List<CartItemVO> voList = cartMapper.getCartList(memberId);
		
		for ( int i = 0; i < voList.size(); i++)
		{
			int lid = voList.get(i).getLid();
			LiquorVO liquor = liquorMapper.getLiquor(lid);
			int quantity = voList.get(i).getQuantity();
			int itemTotalPrice = voList.get(i).getItemTotalPrice();
			
			
			CartItemDTO cart = new CartItemDTO();
			cart.setMemberId(memberId);
			cart.setItemTotalPrice(itemTotalPrice);
			cart.setQuantity(quantity);		
			cart.setLiquor(liquor); 
			cartList.add(cart);
		}
		return cartList;

		
	}


	@Override
	public void addItemToCart(CartItemVO cartItem) {
		
		//memberid가 가지고 있는 모든 liquor의 lid List
		List<Integer> lidList = cartMapper.getLidbyMemberId(cartItem.getMemberId());
		
		if (lidList.contains(cartItem.getLid()))
		{
			int quantity = cartItem.getQuantity()+1;
			int totalPrice = (cartItem.getItemTotalPrice() / cartItem.getQuantity()) * quantity;
			cartItem.setQuantity(quantity);
			cartItem.setItemTotalPrice(totalPrice);
			cartMapper.updateCartItem(cartItem);
		}
		else
		{
			cartMapper.addItemToCart(cartItem);
		}

	}


	@Override
    public void deleteCartItems(List<Integer> lids) {
        cartMapper.deleteCartItemsByLids(lids);
    }


	@Override
	public void updateCartItem(CartItemVO cartItem) {
		cartMapper.updateCartItem(cartItem);
	}
	
	
//	
//	@Override
//	public List<CartDTO> getCartList(String memberId) {
//		List<CartDTO> cart = cartMapper.getCart(memberId);
//		
//		for(CartDTO dto : cart) {
//			dto.initSaleTotal();
//		}
//		
//		return cart;
//	}
}
