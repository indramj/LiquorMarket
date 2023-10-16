package com.first.mapper;

import java.util.List;

import com.first.domain.ImageFileVO;

public interface ImageFileMapper {
	
	public void regist(ImageFileVO vo);
	
	public List<ImageFileVO>getListByLid(int lid);
	

}
