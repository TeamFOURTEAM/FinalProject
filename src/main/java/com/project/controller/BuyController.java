package com.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.service.BuyService;
import com.project.vo.BasketVO;

@Controller
public class BuyController {
	
	@Autowired
	private BuyService buyService;
	
	/** 장바구니에 추가 **/
	@RequestMapping("/basket_add")
	public ModelAndView basket_add(
			BasketVO b,
			HttpServletRequest request,
			HttpServletResponse response) {
		
		/* session id 값이 있을 때 장바구니추가 활성화 */
		
		
		
		return new ModelAndView("/basket_list");
	}//basket_add()
	
}



















