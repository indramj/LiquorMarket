package com.first.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.first.domain.CartItemDTO;
import com.first.domain.CartItemVO;
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
			CartItemDTO cart = new CartItemDTO();
			cart.setMemberId(memberId);
			cart.setPrice(voList.get(i).getPrice());
			cart.setQuantity(voList.get(i).getQuantity());		
			cart.setLiquor(liquorMapper.getLiquor(voList.get(i).getLid())); 
			cartList.add(cart);
		}
		return cartList;

		
	}


	@Override
	public void addItemToCart(CartItemVO cartItem) {
		cartMapper.addItemToCart(cartItem);
	}


	@Override
	public void deleteCartItem(int lid) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void updateCartItem(int lid, int quantity, int price) {
		// TODO Auto-generated method stub
		
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
