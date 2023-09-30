package com.first.service;

import java.util.List;

import com.first.domain.LiquorVO;

public interface LiquorService {
	
	public List<LiquorVO> getLiquorList();
	
	public LiquorVO getLiquor(int lid);
	
	public int register(LiquorVO liquorVO);
	

}
