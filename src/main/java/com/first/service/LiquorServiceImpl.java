package com.first.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.first.domain.BoardVO;
import com.first.domain.Criteria;
import com.first.domain.ImageFileVO;
import com.first.domain.LiquorVO;
import com.first.mapper.CartMapper;
import com.first.mapper.ImageFileMapper;
import com.first.mapper.LiquorMapper;


@Service
public class LiquorServiceImpl implements LiquorService{
	
	@Autowired
	LiquorMapper liquorMapper;
	
	@Autowired
	ImageFileMapper imageMapper;
	
	@Autowired
	CartMapper cartMapper;
	
	@Override
	public List<LiquorVO> getLiquorList()
	{
		return liquorMapper.getListAll();
	}
	
	@Override
	public List<LiquorVO> getList(Criteria cri)
	{
		return liquorMapper.getListWithPage(cri);
	}
	
	public int getTotalCount(Criteria cri)
	{
		return liquorMapper.getTotalCount(cri);
	}
	
	@Transactional
	@Override
	public void register(LiquorVO liquorVO)
	{
		if(liquorVO.getImageList() == null || liquorVO.getImageList().size() == 0) {
			return;
		}
		
		liquorMapper.registSelectKey(liquorVO);
		
		liquorVO.getImageList().forEach(image -> {
			image.setLid(liquorVO.getLid());
			imageMapper.regist(image);
		});
		
	}
	
	@Override
	public LiquorVO getLiquor(int lid)
	{
		return liquorMapper.getLiquor(lid);
	}
	
	@Override
	public boolean modify(LiquorVO liquorVO)
	{
		boolean result =  liquorMapper.updateLiquor(liquorVO) == 1;
		return result;
	}
	
	@Override
	@Transactional
	public void remove(int lid)
	{	
		cartMapper.deleteCartItemByLid(lid);
		imageMapper.removeImages(lid);
		liquorMapper.remove(lid);
	}
	
	@Override
	public List<ImageFileVO> getAttachList(int lid)
	{
		return imageMapper.getListByLid(lid);
	}

}
