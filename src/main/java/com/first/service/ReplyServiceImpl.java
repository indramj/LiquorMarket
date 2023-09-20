package com.first.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.first.domain.ReplyVO;
import com.first.mapper.ReplyMapper;

import lombok.Setter;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Setter(onMethod_= @Autowired)
	ReplyMapper replyMapper;
	
	public long register(ReplyVO replyVO)
	{
		long result = replyMapper.register(replyVO);
		return result;
	}
	
	public List<ReplyVO> getList(long bno)
	{
		return replyMapper.getList(bno);
	}

}
