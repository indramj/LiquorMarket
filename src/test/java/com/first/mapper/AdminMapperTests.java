package com.first.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.first.domain.DrinkVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class AdminMapperTests {

	@Autowired
	private AdminMapper mapper;
	
	/* 주류 등록 */
	@Test
	public void bookEnrollTest() throws Exception{
		
		DrinkVO drink = new DrinkVO();
		
		drink.setDrinkName("mapper 테스트");
		drink.setDrinkId(123);
		drink.setCateCode("1233");
		drink.setCateName("증류주");
		drink.setDrinkPrice(2000);
		drink.setDrinkIntro("주류 소개 ");
		
		mapper.drinkEnroll(drink);
	}
}
