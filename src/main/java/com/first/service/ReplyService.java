package com.first.service;

import java.util.List;

import com.first.domain.ReplyVO;

public interface ReplyService {
	
	public long register(ReplyVO replyVO);
	
	public List<ReplyVO> getList(long bno);
	
	public void remove(Long rno);
	
	//게시글 삭제시 삭제할 글의 댓글도 모두 삭제
	public void removeByBno(Long bno); 
	
	public int updateReply(ReplyVO replyVO);
	
	

}
