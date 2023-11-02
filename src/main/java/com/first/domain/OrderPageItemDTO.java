package com.first.domain;

import lombok.Data;

@Data
public class OrderPageItemDTO {
	
	/* 뷰로부터 전달받을 값 */
    private int lid;   
    private int stock;
    
    /* DB로부터 꺼내올 값 */
    private String name;    
    private int price;
    
    /* 만들어 낼 값 */
    private int salePrice;   //상품의 가격
    private int totalPrice;  //총 가격

    public void initSaleTotal() {
		this.salePrice = (int) (this.price);
		this.totalPrice = this.salePrice*this.stock;
}
   
}
