package com.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ShopController {
	
	/** shop 리스트로 이동 **/
	@RequestMapping("shop/total_shop")
	public ModelAndView shop_list() {
		
		return new ModelAndView("shop/shop_list");
	}//shop_list()
	
	
	/** shop 관리자 글쓰기 **/
	@RequestMapping("shop/shop_write")
	public ModelAndView shop_write() {
		
		return new ModelAndView("shop/shop_write");
	}//shop_write()
}
