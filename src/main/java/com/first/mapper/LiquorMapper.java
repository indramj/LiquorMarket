package com.first.mapper;

import java.util.List;

import com.first.domain.BoardVO;
import com.first.domain.LiquorVO;

public interface LiquorMapper {
	
	public List<LiquorVO>getListAll();
	
	public int register(LiquorVO liquorVO);
	
	public LiquorVO getLiquor(int lid);
	
	public int updateLiquor(LiquorVO liquorVO);

}
