package com.first.domain;

import lombok.Data;

@Data
public class CartItemDTO {
	
	private String memberId;
	
	private LiquorVO liquor;
	
	private int quantity;
	
	private int itemTotalPrice;
	
	
	
	
}

	
