package com.first.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.first.domain.CateVO;
import com.first.domain.Criteria;
import com.first.domain.DrinkVO;
import com.first.mapper.AdminMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class AdminServiceImpl implements AdminService {

	@Setter(onMethod_= @Autowired )
	private AdminMapper adminMapper;

	// 주류 등록
	@Override
	public void enrollDrink(DrinkVO drink) {
		log.info("(service)enrollDrink......");

		adminMapper.enrollDrink(drink);
	}

	/* 카테고리 리스트 */
	@Override
	public List<CateVO> cateList() {
		
		log.info("(service)cateList........");
		
		return adminMapper.cateList();
	}
	/* 상품 리스트 */
	@Override
	public List<DrinkVO> getGoodsList(Criteria cri) {
		log.info("getGoodsTotalList()..........");
		return adminMapper.getGoodsList(cri);
	}

	/* 상품 총 갯수 */
	public int getGoodsTotal(Criteria cri) {
		log.info("getGoodsTotal().........");
		return adminMapper.getGoodsTotal(cri);
	}
	
	/* 상품 조회 페이지 */
	@Override
	public DrinkVO getGoodsDetail(int drinkId) {
		
		log.info("(service)getDrinkDetail......." + drinkId);
		
		return adminMapper.getGoodsDetail(drinkId);
	}
}
