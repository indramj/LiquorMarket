package com.first.mapper;

import java.util.List;

import com.first.domain.ReplyVO;

public interface ReplyMapper {
	
	public int register(ReplyVO replyVO);
	
	public List<ReplyVO> getList(long bno);
	
	public void remove(Long rno);

}
