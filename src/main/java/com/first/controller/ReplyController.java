package com.first.controller;


import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


import com.first.domain.ReplyVO;
import com.first.service.ReplyService;

import lombok.AllArgsConstructor;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/replies/")
@Log4j
@AllArgsConstructor
public class ReplyController {
	
	private ReplyService replyService;
	
	@GetMapping(value = "/{bno}",
			produces = {MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE})
	public ResponseEntity<List<ReplyVO>> getList(@PathVariable("bno") Long bno) {
	
		return new ResponseEntity<>(replyService.getList(bno), HttpStatus.OK);
	}
	
	
//	@PostMapping(value = "", consumes = "application/json", 
//			produces = MediaType.TEXT_PLAIN_VALUE)
	@PreAuthorize("isAuthenticated()")
	@PostMapping("")
	public ResponseEntity<Long> create(@RequestBody ReplyVO replyVO) {
	
		long rno = replyService.register(replyVO);
	
		return new ResponseEntity<>(rno, HttpStatus.OK);
			
	}
	@PreAuthorize("principal.username == #replyer")
	@DeleteMapping("/{rno}")
	public ResponseEntity<String> remove(@PathVariable("rno") Long rno , String replyer)
	{
		replyService.remove(rno);
		return new ResponseEntity<>("success" , HttpStatus.OK);
	}
	
	@PutMapping("")
	@PreAuthorize("principal.username == #replyVO.replyer")
	public ResponseEntity<String> modify(@RequestBody ReplyVO replyVO)
	{
		int result = replyService.updateReply(replyVO);
		return new ResponseEntity<>("success" , HttpStatus.OK); 
		
	}
}
