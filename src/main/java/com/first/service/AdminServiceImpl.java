package com.first.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public void drinkEnroll(DrinkVO drink) {
		log.info("(service)drinkEnroll......");

		adminMapper.drinkEnroll(drink);
	}

}
