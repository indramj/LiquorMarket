package com.first.domain;

import lombok.Data;

@Data
public class CartDTO {
	private int cartId;
    
    private String memberId;
    
    private int drinkId;
    
    private int drinkCount;
    
    // 술
    private String drinkName;
    
    private int drinkPrice;
   
    
    // 추가
    private int salePrice;
    
    private int totalPrice;
    
    public void initSaleTotal() {
		this.totalPrice = this.salePrice * this.drinkCount;
	}
}
