package com.first.mapper;

import java.util.List;

import com.first.domain.ReplyVO;

public interface ReplyMapper {
	
	public int register(ReplyVO replyVO);
	
	public List<ReplyVO> getList(Long bno);
	
	public void remove(Long rno);
	
	public void removeByBno(Long bno);
	
	public ReplyVO read(Long rno);
	
	public int updateReply(ReplyVO replyVO);

}
