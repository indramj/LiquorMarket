package com.first.mapper;

import java.util.List;


import com.first.domain.Criteria;
import com.first.domain.LiquorVO;

public interface LiquorMapper {
	
	public List<LiquorVO>getListAll();
	
	public List<LiquorVO>getListWithPage(Criteria cri);
	
	public int getTotalCount(Criteria cri);
	
	public int register(LiquorVO liquorVO);
	
	public void registSelectKey(LiquorVO liquorVO);
	
	public LiquorVO getLiquor(int lid);
	
	public int updateLiquor(LiquorVO liquorVO);
	
	public void remove(int lid);

}
