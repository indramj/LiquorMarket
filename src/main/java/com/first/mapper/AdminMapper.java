package com.first.mapper;

import java.util.List;

import com.first.domain.CateVO;
import com.first.domain.Criteria;
import com.first.domain.LiquorVO;

public interface AdminMapper {

	public void enrollDrink(LiquorVO drink);
	
	public List<CateVO> cateList();

	public List<LiquorVO> getGoodsList(Criteria cri);
	
	public int getGoodsTotal(Criteria cri);

	public LiquorVO getGoodsDetail(int drinkId);
	
	public List<LiquorVO>getList();
}