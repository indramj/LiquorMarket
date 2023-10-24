package com.first.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.first.domain.BoardVO;
import com.first.domain.Criteria;
import com.first.domain.ImageFileVO;
import com.first.domain.LiquorVO;
import com.first.domain.PageDTO;
import com.first.service.LiquorService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/liquor/*")
@Log4j
public class LiquorController {
	
	@Autowired
	LiquorService liquorService;
	
	@GetMapping("/liquorList")
	
	public void list(Criteria cri , Model model)
	{
		cri.setSize(12); // 한페이지에 나오게할 상품의 갯수
		List<LiquorVO> liquorList = liquorService.getList(cri);
		int totalLiquorCount = liquorService.getTotalCount(cri);
		
		model.addAttribute("liquorList" , liquorList);
		model.addAttribute("pageDTO" , new PageDTO(cri , totalLiquorCount));
		
	}
	
	@GetMapping("/regist")
	public void regist()
	{
		log.info("liquor regist");
	}
	
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MANAGER')")
	@PostMapping("/regist")
	public String regist(LiquorVO liquorVO , RedirectAttributes rttr )
	{	
		log.info("Post liquor regist");
		liquorService.register(liquorVO);

		rttr.addFlashAttribute("liquor", liquorVO);
		return "redirect:/liquor/liquorList";
	}
	
	@GetMapping({"/read" , "/modify"})
	public void read(@RequestParam("lid") int lid , Model model)
	{
		LiquorVO liquor = new LiquorVO();
		liquor = liquorService.getLiquor(lid);
		model.addAttribute("liquor" , liquor);
	}

	@PostMapping("/modify")
	public String modify( LiquorVO liquorVO , @ModelAttribute("cri") Criteria cri, Model model , RedirectAttributes rttr)
	{
		liquorService.modify(liquorVO);
		rttr.addAttribute("lid" , liquorVO.getLid());
		rttr.addAttribute("currentPage" , cri.getCurrentPage());
		return "redirect:/liquor/read";
		
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("lid") int lid)
	{
		liquorService.remove(lid);
		return "redirect:/liquor/liquorList";
	}
	
	@GetMapping("/getAttachList")
	@ResponseBody
	public ResponseEntity<List<ImageFileVO>> getAttachList(int lid){
		log.info("getAttachList " + lid);
		return new ResponseEntity<>(liquorService.getAttachList(lid), HttpStatus.OK);
	}
	
}
