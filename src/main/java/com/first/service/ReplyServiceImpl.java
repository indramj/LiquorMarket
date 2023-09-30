package com.first.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.first.domain.ReplyVO;
import com.first.mapper.BoardMapper;
import com.first.mapper.ReplyMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class ReplyServiceImpl implements ReplyService {
	
	private final ReplyMapper replyMapper;
	private final BoardMapper boardMapper;
	
	
	@Transactional
	@Override
	public long register(ReplyVO replyVO)
	{
		long result = replyMapper.register(replyVO);
		boardMapper.updateReplyCnt(replyVO.getBno());
		return result;
	}
	
	@Override
	public List<ReplyVO> getList(long bno)
	{
		return replyMapper.getList(bno);
	}
	
	@Transactional
	@Override
	public void remove(Long rno)
	{
		ReplyVO replyVO= replyMapper.read(rno);
		replyMapper.remove(rno);
		boardMapper.updateReplyCnt(replyVO.getBno());
	}
	
	@Override
	public void removeByBno(Long bno)
	{
		replyMapper.removeByBno(bno);
	}
	
	@Override
	public int updateReply(ReplyVO replyVO)
	{
		return replyMapper.updateReply(replyVO);
	}

}
