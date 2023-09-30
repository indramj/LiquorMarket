package com.first.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.first.domain.BoardVO;
import com.first.domain.Criteria;
import com.first.mapper.BoardMapper;
import com.first.mapper.ReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class BoardServiceImpl implements BoardSerivce{
	
	@Setter(onMethod_=@Autowired)
	BoardMapper mapper;
	@Setter(onMethod_=@Autowired)
	ReplyMapper replyMapper;
	
	@Override
	public List<BoardVO> getList(Criteria cri)
	{
		log.info("service->getList()");
		return mapper.getListWithPage(cri);
	}
	
	@Override
	public void register(BoardVO boardVO)
	{
		log.info("service->insert()");
		mapper.insert(boardVO);
		
	}
	
	@Override
	public BoardVO getBoard(Long bno)
	{
		return mapper.getBoard(bno);
	}
	
	@Override
	public int getTotalBoard(Criteria cri)
	{
		return mapper.getTotalBoard(cri);
	}
	
	@Override
	public boolean modify(BoardVO boardVO)
	{
		boolean result =  mapper.updateBoard(boardVO) == 1;
		return result;
	}
	
	@Transactional
	@Override
	public boolean remove(Long bno)
	{
		
		replyMapper.removeByBno(bno);
		boolean result = mapper.delete(bno) == 1;
		return result;
	}

}
