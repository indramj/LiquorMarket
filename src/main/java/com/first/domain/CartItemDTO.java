package com.first.domain;

import lombok.Data;

@Data
public class CartItemDTO {
	
	private String memberId;
	
	private LiquorVO liquor;
	
	private int quantity;
	
	private int price;
	
	 public void setLid(LiquorVO liquor) {
	        this.liquor = liquor;
	    }
	 
//	public void setQuantity(int quantity)
//	{
//		this.quantity = quantity;
//		update();	
//	}
//	
//	private int update()
//	{
//		return this.price = quantity * liquor.getPrice();
//	}
	
}

	
