package com.first.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.first.domain.Criteria;
import com.first.domain.DrinkVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class AdminMapperTests {

	@Autowired
	private AdminMapper mapper;
	/* 상품 조회 페이지 */
//	@Test
//	public void goodsGetDetailTest() {
//		
//		int drinkId = 150;
//		
//		DrinkVO result = mapper.getGoodsDetail(drinkId);
//		
//		System.out.println("상품 조회 데이터 : " + result);
//		
//		
//	}
	/* 주류 등록 
	@Test
	public void drinkEnrollTest() throws Exception{
		
		DrinkVO drink = new DrinkVO();
		
		drink.setDrinkName("mapper 테스트");
		drink.setDrinkId(123);
		drink.setCateCode("1233");
		drink.setCateName("증류주");
		drink.setDrinkPrice(2000);
		drink.setDrinkIntro("주류 소개 ");
		
		mapper.enrollDrink(drink);
	} */
	
	/* 카테고리 리스트 
	@Test
	public void cateListTest() throws Exception{
		
		System.out.println("cateList()..........." + mapper.cateList());
		
	}*/
	/* 상품 리스트 & 상품 총 갯수 */
//	@Test
//	public void goodsGetListTest() {
//		
//		Criteria cri = new Criteria();
//		
//		/* 검색조건 */
//		cri.setKeyword("테스트");
//		
//		/* 검색 리스트 */
//	List list = mapper.getGoodsList(cri);
//	for(int i = 0; i < list.size(); i++) {
//			System.out.println("result......." + i + " : " + list.get(i));
//		}
//		
//		/* 상품 총 갯수 */
//		int result = mapper.getGoodsTotal(cri);
//		System.out.println("resutl.........." + result);
//		
//		
//	}
}
