package com.first.mapper;

import java.util.List;

import com.first.domain.BoardVO;
import com.first.domain.Criteria;

public interface BoardMapper {
	
	public List<BoardVO> getListWithPage(Criteria cri);
	
	public void insert(BoardVO boardVO);
	
	public BoardVO getBoard(Long bno);
	
	public int getTotalBoard(Criteria cri);
	
	public int updateBoard(BoardVO boardVO);
	
	public int delete(Long bno);

}
