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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.service.BasketService;
import com.project.vo.BasketVO;

/** 장바구니 컨트롤러 **/
@Controller
public class BasketController {
	
	@Autowired
	private BasketService basketService;
	
	/** 장바구니 상품 목록 **/
	@RequestMapping("shop/basket_list")
	public String basket_list(
			HttpServletRequest request,
			HttpServletResponse response,
			Model basketList) throws Exception {
		
		int page=1;
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));
		}//page 값 받아옴
		
		response.setContentType("text/html;chrset=UTF-8");
		PrintWriter out=response.getWriter();
		
		String basket_id=request.getParameter("basket_id");
	
		if(basket_id.equals(null)) {//id 값이 없을 때(나중에 세션으로 처리)
			out.println("<script>");
			out.println("alert('로그인 하신 후 이용해주세요.');");
			out.println("history.back();");
			out.println("</script>");
		
		}else {
			Map<String,Object> map=new HashMap<String, Object>();
			List<BasketVO> list=this.basketService.listBasket(basket_id);//장바구니 정보
			
			int sumMoney=this.basketService.sumMoney(basket_id);//장바구니 전체 금액 호출
			/* 장바구니 전체 금액에 따라 배송비 구분 */
			//배송료(10만원 이상 -> 무료, 미만 -> 2500원)
			int fee = sumMoney >= 100000 ? 0 : 2500;
			
			map.put("list",list); //장바구니 정보
			map.put("count",list.size());//장바구니 상품 유무
			map.put("sumMoney",sumMoney);//장바구니 합계 금액
			map.put("fee",fee);//배송비
			map.put("allSum",sumMoney+fee);//주문 총 합계 금액(상품 + 배송비)
			
			basketList.addAttribute("basket_id",basket_id);//id값 전달
			basketList.addAttribute("page",page);//page 값 받아서 전달(목록버튼에 전달하기위함)
			basketList.addAttribute("map",map);
			
		}//if else

		return "shop/basket_list";
	}
	
	/** 장바구니 상품 삭제 **/
	@RequestMapping("shop/basket_del")
	public String basket_del(
				BasketVO b,
				HttpServletRequest request,
				RedirectAttributes redirectAttributes) throws Exception {
		
		int basket_no = b.getBasket_no();
		this.basketService.delBasket(basket_no);
		
		String basket_id = request.getParameter("basket_id");
		int page = Integer.parseInt(request.getParameter("page"));
		
		/*  <매우 중요!>
		 * 장바구니 목록 리스트를 리다이렉트 해줄때, 장바구니 목록에 들어가는 두가지 변수
		 * 유저아이디와 page 변수를 똑같이 보내줘야 한다. 장바구니 목록에서 이 두개의 변수를
		 * 담아서 리스트를 출력하고 있기 때문. 그러기위해서 변수를 받아와서
		 * 리다이렉트 할때 변수를 보내주게끔 함.(나중에 아이디는 뺀다. 세션으로 처리할것이기 때문)
		 */
		redirectAttributes.addAttribute("basket_id",basket_id);
		redirectAttributes.addAttribute("page",page);
		
		return "redirect:/shop/basket_list";
	}//basket_del()	
}
