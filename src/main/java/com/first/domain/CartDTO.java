package com.first.domain;

import java.util.List;

import lombok.Data;

@Data
public class CartDTO {
	
	private Long memberId;
	
	private List<CartItemVO> cartList;
	
	

}
