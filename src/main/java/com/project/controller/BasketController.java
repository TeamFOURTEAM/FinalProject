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
		
		/* session id 값이 있을 때 장바구니추가 활성화시켜야 함(session으로 수정할것) */
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		String basket_id=request.getParameter("basket_id");
		int product_no=Integer.parseInt(request.getParameter("product_no"));
		int basket_count=Integer.parseInt(request.getParameter("basket_count"));
		int price=Integer.parseInt(request.getParameter("price"));
		int price_sum=Integer.parseInt(request.getParameter("price_sum"));
		
		if(basket.getBasket_id() == null) {//id 값이 없을 때
			out.println("<script>");
			out.println("alert('다시 로그인 해주세요.');");
			out.println("location='history.back();';");
			out.println("</script>");
			
		}else {//id 값이 있을 때
			basket.setBasket_id(basket_id); basket.setProduct_no(product_no);
			basket.setBasket_count(basket_count); basket.setPrice(price);
			basket.setPrice_sum(price_sum); 
			
			this.buyService.addBasket(basket);//장바구니에 상품 추가
			
		}//if else
		
		
		return new ModelAndView("shop/basket_list");
	}//basket_add()
	
}



















