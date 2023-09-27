package com.first.mapper;

import java.util.List;

import com.first.domain.CateVO;
import com.first.domain.Criteria;
import com.first.domain.DrinkVO;

public interface AdminMapper {

	public void enrollDrink(DrinkVO drink);
	
	public List<CateVO> cateList();

	public List<DrinkVO> getGoodsList(Criteria cri);
	
	public int getGoodsTotal(Criteria cri);

	public DrinkVO getGoodsDetail(int drinkId);
	
	public List<DrinkVO>getList();
}