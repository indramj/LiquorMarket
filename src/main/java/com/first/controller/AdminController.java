package com.first.controller;


import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.first.domain.Criteria;
import com.first.domain.DrinkVO;
import com.first.domain.PageDTO;
import com.first.service.AdminService;

@Controller
@RequestMapping("/admin")
	public class AdminController {
	
	 private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	 
	 @Autowired
	 private AdminService adminService;
	 	 	 
	 // 관리자 메인 페이지 이동 
	    @RequestMapping(value="main", method = RequestMethod.GET)
	    public void getAdminMain() throws Exception{
	        
	        logger.info("관리자 페이지로 이동");	        	        
	    }
	    
	  /*상품 리스트 데이터*/
	    
	    @RequestMapping(value = "manageGoods", method = RequestMethod.POST)
	    public void postManageGoods(Criteria cri, Model model) throws Exception{
	    	
	    	logger.info("상품 관리 (상품 목록) 페이지 접속");
	    	
	  
	    	/* 상품 리스트 데이터 */
	    List list = adminService.getGoodsList(cri);
	   
	    if(!list.isEmpty()) {
	    	model.addAttribute("list", list);
	    }else {
	   	model.addAttribute("listCheck", "empty");
	   	return;
	   }
	    /*페이지 인터페이스 데이터*/
	   model.addAttribute("pageMaker", new PageDTO(cri, adminService.getGoodsTotal(cri)));
	   }
	    
 
	    
	    /* 상품 관리 페이지 접속 */
		@RequestMapping(value = "manageGoods", method = RequestMethod.GET)
		public void getManageGoods(Criteria cri, Model model) throws Exception{
			logger.info("상품 관리 페이지 접속");
			
			
		}
		
		
	    /* 상품 등록 페이지 접속 */
	    @RequestMapping(value = "enrollGoods", method = RequestMethod.GET)
	    public void enrollGoods() throws Exception{
	        logger.info("상품 등록 페이지 접속");
	        
	        
	        List list = adminService.cateList();
	    }  
	    
  	
	    
	  //상품 등록 
	    	@PostMapping("/enrollGoods")
	    	public String enrollGoodsPOST(DrinkVO drink, RedirectAttributes rttr) {
	    		
	    		logger.info("enrollGoodsPOST......" + drink);
	    		
	    		adminService.enrollDrink(drink);
	    		
	    		rttr.addFlashAttribute("enroll_result", drink.getDrinkName());
	    		
	    		return "redirect:/admin/manageGoods";
	    	}	
	    	
	    	/* 상품 조회 페이지 */
	    	@GetMapping("/goodsDetail")
	    	public void getGoodsInfo(int drinkId, Criteria cri, Model model) {
	    		
	    		logger.info("getGoodsInfo()........." + drinkId);
	    		
	    		/* 목록 페이지 조건 정보 */
	    		model.addAttribute("cri", cri);
	    		
	    		/* 조회 페이지 정보 */
	    		model.addAttribute("goodsInfo", adminService.getGoodsDetail(drinkId));
	    		
	    	}
	    }
