package com.first.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class Criteria {
	private int currentPage;
	private int size;
	private String type;
	private String keyword;
	
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
	
	public String[] getTypeArr() {
		return type == null? new String[] {} : type.split("");
	}
	
	public String getListLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("currentPage", currentPage);
				//.queryParam("amount", size);
//				.queryParam("type", type)
//				.queryParam("keyword", keyword);
		return builder.toUriString();
	}

	
	
	
}
