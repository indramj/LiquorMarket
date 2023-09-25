package com.first.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.first.domain.ReplyVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTest {
	@Autowired
	ReplyMapper replyMapper;
	
//	@Test
//	public void testInsertReply()
//	{
//		ReplyVO replyVO = new ReplyVO();
//		replyVO.setBno(77L);
//		replyVO.setReplyer("replyTestUser");
//		replyVO.setReply("replyTest");
//		replyMapper.register(replyVO);
//		
//	}
	
//	@Test
//	public void insertDummies()
//	{
//		for ( int i = 0; i < 10; i++)
//		{
//			ReplyVO replyVO = new ReplyVO();
//			replyVO.setBno(320);
//			replyVO.setReplyer("replyTestUser..." + i);
//			replyVO.setReply("replyTest..." + i);
//			replyMapper.register(replyVO);
//		}	
//	}
	
//	@Test
//	public void deleteTest()
//	{
//		Long rno = 69L;
//		
//		replyMapper.remove(rno);
//	}
	
	@Test
	public void updateReplyTest()
	{
		ReplyVO vo = new ReplyVO();
		vo.setRno(50L);
		vo.setReply("수정 해 봅시다.");
		replyMapper.updateReply(vo);
		
		log.info(replyMapper.read(50L));

	}
	

}
