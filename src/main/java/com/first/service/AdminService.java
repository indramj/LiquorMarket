package com.first.service;

import java.util.List;


import com.first.domain.Criteria;
import com.first.domain.LiquorVO;

public interface AdminService {


	/* 상품 리스트 */
	public List<LiquorVO> getGoodsList(Criteria cri);
	
	/* 상품 총 개수 */
	public int getGoodsTotal(Criteria cri);
	
	public List<LiquorVO> getListAll();
	
	public LiquorVO getGoodsDetail(int lId);
}
