package com.first.mapper;

import java.util.Iterator;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.first.domain.BoardVO;
import com.first.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTest {
	
	@Setter(onMethod_= @Autowired)
	private BoardMapper mapper;
	
//	@Test
//	public void getList()
//	{
//		mapper.getList().forEach(board -> log.info(board));
//	}
	
//	@Test
//	public void insertDummies()
//	{
//		BoardVO board = new BoardVO();
//		for( int i = 0; i < 200; i++)
//		{
//			board.setWriter("user"+ i);
//			board.setTitle("Test Title" + i);
//			board.setContent("Test Content" + i);
//			mapper.insert(board);
//		}
//	}
//	
//	@Test
//	public void testGetBoard()
//	{
//		Long bno = 50L;
//		
//		log.info(mapper.getBoard(bno));
//		
//	}
	
//	@Test
//	public void testListWithPage()
//	{
//		Criteria cri = new Criteria();
//		
//		cri.setCurrentPage(1);
//		cri.setSize(10);
//		
//		List<BoardVO> list = mapper.getListWithPage(cri);
//		list.forEach(board -> log.info(board));
//		
//	}
	
//	@Test
//	public void testUpdate()
//	{
//		BoardVO board = new BoardVO();
//		board.setBno(99);
//		board.setTitle("수정된 제목");
//		board.setContent("수정된내용");
//		mapper.updateBoard(board);
//		log.info(mapper.getBoard(board.getBno()));
//	}
	
//	@Test
//	public void testDelete()
//	{
//		Long bno = 101L;
//		mapper.delete(bno);
//		
//	}
	
//	@Test
//	public void updateReplyCnt()
//	{
//		List<BoardVO> boardList = mapper.getList();
//		boardList.forEach(arr -> {
//				mapper.updateReplyCnt(arr.getBno());
//		});
//		
//	}
}
