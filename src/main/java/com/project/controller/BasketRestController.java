package com.project.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.project.service.BasketService;
import com.project.vo.BasketVO;

/** 장바구니 컨트롤러(RestController - ajax) **/
@RestController
public class BasketRestController {
	
	@Autowired
	private BasketService basketService;
	
	/** 장바구니에 추가 **/
	@RequestMapping(value="/shop/basket_add",method=RequestMethod.POST)
	public ResponseEntity<String> basket_add(
			@RequestBody BasketVO basket) throws Exception {
		
		/* session id 값이 있을 때 장바구니추가 활성화시켜야 함(session으로 수정할것) */
//		response.setContentType("text/html;charset=UTF-8");
//		PrintWriter out=response.getWriter();
		
		ResponseEntity<String> entity=null;
//		String userId = (String) session.getAttribute("user_id");
		
		//장바구니에 먼저 담은 상품이 있는지 검사
		int count=
			this.basketService.countBasket(basket.getProduct_no(),basket.getBasket_id());
		
		if(basket.getBasket_id() == null) {//id 값이 없을 때(session처리?)
//			out.println("<script>");
//			out.println("alert('다시 로그인 해주세요.');");
//			out.println("location='history.back();';");
//			out.println("</script>");
			
		}else {//id 값이 있을 때
			try {
				
				if(count == 0) {//없으면 추가
					this.basketService.addBasket(basket);//장바구니에 상품 추가
				}else {//있으면 수정(update)
					this.basketService.updateBasket(basket);//장바구니 상품 갱신
				}
				
				entity=new ResponseEntity<String>("SUCCESS",
					HttpStatus.OK);//장바구니 성공시 'SUCCESS'문자열을
				//반환하고 정상상태코드 200 을 반환(HttpStatus.OK에 해당)
				
			}catch(Exception e) {
				e.printStackTrace();
				entity=new ResponseEntity<String>(e.getMessage(),
						HttpStatus.BAD_REQUEST);//장바구니 담기 실패하면 
				//예외에러 메시지를 전송하고, 사용자에게 나쁜 상태코드가 전송됨
			}
		}//if else
		
		return entity;
	}//basket_add()
	
	/** 회원 아이디와 상품번호에 따른 장바구니 수정 **/
//	@RequestMapping(value="/shop/editBasket/",method=RequestMethod.GET)
//	public String editBasket(
//			@PathVariable("basket_id") String basket_id) {
//		
//		try {
//			map.put("list",list); //장바구니 정보
//			map.put("count",list.size());//장바구니 상품 유무
//			map.put("sumMoney",sumMoney);//장바구니 합계 금액
//			map.put("fee",fee);//배송비
//			map.put("allSum",sumMoney+fee);//주문 총 합계 금액(상품 + 배송비)
//			
//		}catch(Exception e) {
//			e.printStackTrace();
//		}//try catch
//		
//		return map;
//	}//editBasket()
	
	/** 장바구니 상품 삭제 **/
}



















