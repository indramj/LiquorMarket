package com.first.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class Criteria {
	private int currentPage;
	private int size;
	
	public Criteria()
	{
		this.currentPage = 1;
		this.size = 10;
	}
	
	public Criteria(int page , int size,    int pageNum, int amount)
	{
		this.currentPage = page;
		this.size = size;
		
		
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	
	public String getListLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("currentPage", currentPage);
				//.queryParam("amount", size);
//				.queryParam("type", type)
//				.queryParam("keyword", keyword);
		return builder.toUriString();
	}


    /* 현재 페이지 번호 */
    private int pageNum;
    /* 페이지 표시 개수 */
    private int amount;
    /* 검색 타입 */
    private String type;
    /* 검색 키워드 */
    private String keyword;
	
}
