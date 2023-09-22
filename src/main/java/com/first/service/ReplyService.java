package com.first.service;

import java.util.List;

import com.first.domain.ReplyVO;

public interface ReplyService {
	
	public long register(ReplyVO replyVO);
	public List<ReplyVO> getList(long bno);
	public void remove(Long rno);
	
	

}
