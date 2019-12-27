package com.project.controller;

import java.io.PrintWriter;

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
		
		
		System.out.println(basket.getBasket_id());//(임시로 히든값으로 아이디 전달)
		System.out.println(basket.getProduct_no());
		System.out.println(basket.getBasket_count());
		System.out.println(basket.getPrice_sum());
		
		/* session id 값이 있을 때 장바구니추가 활성화시켜야 함(session으로 수정) */
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		if(basket.getBasket_id() == null) {//id 값이 없을 때
			out.println("<script>");
			out.println("alert('다시 로그인 해주세요.');");
			out.println("location='history.back();';");
			out.println("</script>");
			
		}else {//id 값이 있을 때
			
			
		}
		
		
		return new ModelAndView("shop/basket_list");
	}//basket_add()
	
}



















