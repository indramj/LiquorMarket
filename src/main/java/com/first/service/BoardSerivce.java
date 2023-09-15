package com.first.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.first.domain.BoardVO;
import com.first.domain.Criteria;


public interface BoardSerivce {
	public List<BoardVO> getList(Criteria cri);
	
	public void register(BoardVO boardVO);
	
	public BoardVO getBoard(Long bno);
	
	public int getTotalBoard(Criteria cri);
	
	
	

}
