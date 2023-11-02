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
		
		int lid = cartItem.getLid();
		
		int quantity = cartItem.getQuantity()+1;
		
		String memberId = cartItem.getMemberId();
		CartItemVO item= new CartItemVO();
		item.setLid(lid);
		item.setMemberId(memberId);
		item.setQuantity(quantity);
		//item.setItemTotalPrice(quantity * );
		
		
		
		if (lidList.contains(lid))
		{
			cartMapper.updateQuantity(memberId , lid , quantity);
		}
		else
		{
			cartMapper.addItemToCart(cartItem);
		}

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
