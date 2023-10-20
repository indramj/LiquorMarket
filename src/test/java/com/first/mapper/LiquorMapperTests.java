package com.first.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.first.domain.LiquorVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class LiquorMapperTests {
	
	@Autowired
	private LiquorMapper liquorMapper;
	
	@Test
	public void insertDummies()
	{
		for ( int i = 0; i< 50; i++)
		{
			LiquorVO liquor = new LiquorVO();
			liquor.setLid(i+1);
			liquor.setName("주류이름" + i);
			liquor.setDescription("주류 설명" + i);
			liquor.setPrice( ((i % 5)+1) * 10000  );
			liquor.setStock((int)(Math.random() * 10) + 1);
			if( i % 3 == 1)
			{
				liquor.setCateName("소주");
			}
			else if ( i % 3 == 2)
			{
				liquor.setCateName("맥주");
				
			}
			else
			{
				liquor.setCateName("양주");
			}
			liquorMapper.register(liquor);
		} //for 	
	}
	
//	@Test
//	public void getLiquor()
//	{
//		int lid = 50;
//		log.info(liquorMapper.getLiquor(lid));
//	}

}
