package com.first.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.first.domain.CateVO;
import com.first.domain.Criteria;
import com.first.domain.LiquorVO;
import com.first.mapper.AdminMapper;
import com.first.mapper.LiquorMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class AdminServiceImpl implements AdminService {

	@Setter(onMethod_= @Autowired )
	private AdminMapper adminMapper;
	
	@Setter(onMethod_= @Autowired )
	private LiquorMapper liquorMapper;



	/* 카테고리 리스트 */
	@Override
	public List<CateVO> cateList() {
		
		log.info("(service)cateList........");
		
		return adminMapper.cateList();
	}
	/* 상품 리스트 */
	@Override
	public List<LiquorVO> getGoodsList(Criteria cri) {
		log.info("getGoodsTotalList()..........");
		return adminMapper.getGoodsList(cri);
	}

	/* 상품 총 갯수 */
	public int getGoodsTotal(Criteria cri) {
		log.info("getGoodsTotal().........");
		return adminMapper.getGoodsTotal(cri);
	}
	
	
	public List<LiquorVO> getListAll() {
		return liquorMapper.getListAll();
	}
	
//	/* 상품 조회 페이지 */
//	@Override
//	public DrinkVO getGoodsDetail(int drinkId) {
//		
//		log.info("(service)getDrinkDetail......." + drinkId);
//		
//		return adminMapper.getGoodsDetail(drinkId);
//	}
}
