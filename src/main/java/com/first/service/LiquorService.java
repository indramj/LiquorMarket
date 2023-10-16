package com.first.service;

import java.util.List;

import com.first.domain.BoardVO;
import com.first.domain.ImageFileVO;
import com.first.domain.LiquorVO;

public interface LiquorService {
	
	public List<LiquorVO> getLiquorList();
	
	public LiquorVO getLiquor(int lid);
	
	public void register(LiquorVO liquorVO);
	
	public boolean modify(LiquorVO liquorVO);
	
	public void remove(int lid);
	
	public List<ImageFileVO> getAttachList(int lid);
	
	
	
}
