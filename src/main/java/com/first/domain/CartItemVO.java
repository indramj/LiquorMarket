package com.first.domain;

import lombok.Data;

@Data
public class CartItemVO {
	
	private String memberId;
	
	private int lid;
	
	private int quantity;
	
	private int itemTotalPrice;
	
	

}
