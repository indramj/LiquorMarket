package com.first.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.first.domain.BoardVO;
import com.first.domain.Criteria;
import com.first.domain.PageDTO;
import com.first.service.BoardSerivce;

import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/board/*")
@Log4j
@AllArgsConstructor
public class BoardController {
	
	@Autowired
	private BoardSerivce service;
	
//	@GetMapping("/list")
//	public void list(Model model)
//	{
//		log.info("controller list()");
//		List<BoardVO> BoardList = service.getList();
//		model.addAttribute("boardList" , BoardList);
//		
//	}
	
	@GetMapping("/list")
	public void list(Criteria cri , Model model)
	{
		log.info("listWithPaging()");
		List<BoardVO> boardList = service.getList(cri);
		int totalBoard = service.getTotalBoard(cri);
		model.addAttribute("boardlist" , boardList);
		model.addAttribute("pageDTO" , new PageDTO(cri, totalBoard));
	}
	
	@GetMapping("/register")
	public void register()
	{
		
		
	}
	
	@PostMapping("/register")
	public String register(BoardVO boardVO , RedirectAttributes rttr )
	{
		log.info("================");
		service.register(boardVO);
		rttr.addFlashAttribute("result", boardVO.getBno());//일회성
		
		return "redirect:/board/list";
		
	}
	
	@GetMapping({"/get" , "/modify"})
	public void getBoard(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model)
	{
		model.addAttribute("board" , service.getBoard(bno));
	}
	
	@PostMapping("/modify")
	public String modify( BoardVO boardVO , @ModelAttribute("cri") Criteria cri, Model model , RedirectAttributes rttr)
	{
		service.modify(boardVO);
		rttr.addAttribute("bno" , boardVO.getBno());
		rttr.addAttribute("currentPage" , cri.getCurrentPage());
		return "redirect:/board/get";
		
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno)
	{
		service.remove(bno);
		
		return "redirect:/board/list";
	}
	
	
	
	
	

}
