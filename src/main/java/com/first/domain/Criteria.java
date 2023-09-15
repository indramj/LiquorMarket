package com.first.domain;

import lombok.Data;

@Data
public class Criteria {
	private int currentPage;
	private int size;
	
	public Criteria()
	{
		this.currentPage = 1;
		this.size = 10;
	}
	
	public Criteria(int page , int size)
	{
		this.currentPage = page;
		this.size = size;
	}
	
	
	
}
