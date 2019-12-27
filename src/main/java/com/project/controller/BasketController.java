package com.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.service.BasketService;
import com.project.vo.BasketVO;

/** 장바구니 컨트롤러 **/
@Controller
public class BasketController {
	
	@Autowired
	private BasketService buyService;
	
	/** 장바구니에 추가 **/
	@RequestMapping("shop/basket_add")
	public ModelAndView basket_add(
			BasketVO basket,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		/* session id 값이 있을 때 장바구니추가 활성화시켜야 함 */
		
//		System.out.println(basket.getProduct_no());
//		System.out.println(basket.getBasket_count());
		
		
		
		return new ModelAndView("shop/basket_list");
	}//basket_add()
	
}



















