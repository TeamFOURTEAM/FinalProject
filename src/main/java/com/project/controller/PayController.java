package com.project.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.service.BasketService;
import com.project.vo.BasketVO;

@Controller
public class PayController {
	
	@Autowired
	private BasketService basketService;
	
	/** 결제 페이지의 상품 목록 **/
	@RequestMapping("shop/pay_page")
	public String pay_list(
			HttpServletRequest request,
			HttpServletResponse response,
			Model basketList) throws Exception  {
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		//session 처리!
		String user_id = "pebble";
		
		if(user_id == null) {
			out.println("<script>");
			out.println("alert('로그인 하신 후 이용해주세요.');");
			out.println("location='admin_login';");
			out.println("</script>");
			
		}else {
			Map<String,Object> map=new HashMap<String, Object>();
			List<BasketVO> list=this.basketService.listBasket(user_id);//결제 페이지의 상품 정보
			//만약 유저정보도 뽑아올거면 여기서 메서드 돌리기 -> 회원아이디로 회원정보에서 이름 전번 이메일
			
			int sumMoney=this.basketService.sumMoney(user_id);//결제 페이지의 상품 전체 금액 호출
			/* 장바구니 전체 금액에 따라 배송비 구분 */
			//배송료(10만원 이상 -> 무료, 미만 -> 2500원)
			int fee = sumMoney >= 100000 ? 0 : 2500;
			
			map.put("list",list); //장바구니 정보
			map.put("count",list.size());//장바구니 상품 유무
			map.put("sumMoney",sumMoney);//장바구니 합계 금액
			map.put("fee",fee);//배송비
			map.put("allSum",sumMoney+fee);//주문 총 합계 금액(상품 + 배송비)
			
			basketList.addAttribute("map",map);

		}//if else 
		
		return "shop/pay_page";
	}
	
	/** 결제하기 **/
	
}
