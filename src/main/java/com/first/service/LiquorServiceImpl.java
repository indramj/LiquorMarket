package com.first.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.first.domain.BoardVO;
import com.first.domain.ImageFileVO;
import com.first.domain.LiquorVO;
import com.first.mapper.ImageFileMapper;
import com.first.mapper.LiquorMapper;


@Service
public class LiquorServiceImpl implements LiquorService{
	
	@Autowired
	LiquorMapper mapper;
	
	@Autowired
	ImageFileMapper imageMapper;
	
	@Override
	public List<LiquorVO> getLiquorList()
	{
		return mapper.getListAll();
	}
	
	@Transactional
	@Override
	public void register(LiquorVO liquorVO)
	{
		if(liquorVO.getImageList() == null || liquorVO.getImageList().size() == 0) {
			return;
		}
		
		mapper.registSelectKey(liquorVO);
		
		liquorVO.getImageList().forEach(image -> {
			image.setLid(liquorVO.getLid());
			imageMapper.regist(image);
		});
		
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
	
	@Override
	public void remove(int lid)
	{
		mapper.remove(lid);
	}
	
	@Override
	public List<ImageFileVO> getAttachList(int lid)
	{
		return imageMapper.getListByLid(lid);
	}

}
