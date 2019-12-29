package com.project.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/** 장바구니 + 구매 컨트롤러 **/
@Controller
public class BasketController {
	
	/** 장바구니 상품 목록 **/
	@RequestMapping("shop/basket_list")
	public String basket_list(
			HttpServletRequest request,
			Model basketList) {
		
		int page=1;
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));
		}//page 값 받아옴
		
		basketList.addAttribute("page",page);//page 값 받아서 전달(목록버튼에 전달하기위함)
		
		return "shop/basket_list";
	}
	
}
