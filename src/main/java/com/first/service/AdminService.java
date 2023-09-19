package com.first.service;

import java.util.List;

import com.first.domain.CateVO;
import com.first.domain.Criteria;
import com.first.domain.DrinkVO;

public interface AdminService {


	public void drinkEnroll(DrinkVO drink); //주류 등록
	public List<CateVO> cateList(); //카테고리 리스트
	public List<DrinkVO> goodsGetList(Criteria cri); //상품 리스트
	public int goodsGetTotal(Criteria cri);	 //상품 총 개수
}
