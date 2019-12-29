package com.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/** 장바구니 + 구매 컨트롤러 **/
@Controller
public class BasketController {
	/** 장바구니 상품 목록 **/
	@RequestMapping("shop/basket_list")
	public String basket_list() {
		
		return "shop/basket_list";
	}
	
}
