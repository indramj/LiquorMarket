package com.first.domain;

import lombok.Data;

@Data
public class PageDTO {
	private int totalBoard;  // 전체 게시글 수
	private int startPage;  
	private int endPage;
	private boolean prev, next;
	private Criteria cri;
	
	
	public PageDTO(Criteria cri , int total)
	{
		this.cri = cri;
		this.totalBoard = total;
		
		this.endPage = (int)(Math.ceil(cri.getCurrentPage()/10.0)) * 10;
		this.startPage = this.endPage - 9;
		//endpage의 최소값은 10이기 때문에 startpage의 최소값은 1 단위는 1 ,11 ,21...
		
		int realEnd = (int)(Math.ceil((totalBoard * 1.0) / cri.getSize()));
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}

}
