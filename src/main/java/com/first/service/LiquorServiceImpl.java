package com.first.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.first.domain.BoardVO;
import com.first.domain.LiquorVO;
import com.first.mapper.LiquorMapper;


@Service
public class LiquorServiceImpl implements LiquorService{
	
	@Autowired
	LiquorMapper mapper;
	
	@Override
	public List<LiquorVO> getLiquorList()
	{
		return mapper.getListAll();
	}
	
	@Override
	public int register(LiquorVO liquorVO)
	{
		return mapper.register(liquorVO);
	}
	
	@Override
	public LiquorVO getLiquor(int lid)
	{
		return mapper.getLiquor(lid);
	}
	
	@Override
	public boolean modify(LiquorVO liquorVO)
	{
		boolean result =  mapper.updateLiquor(liquorVO) == 1;
		return result;
	}

}
