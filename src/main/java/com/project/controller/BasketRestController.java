package com.project.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	/** 회원 아이디에 따른 장바구니 목록 불러오기 **/
	@RequestMapping(value="/shop/basketListAll/{basket_id}",method=RequestMethod.GET)
	public Map<String,Object> basketList(
			@PathVariable("basket_id") String basket_id) {
		
		Map<String,Object> map=new HashMap<String, Object>();
		List<BasketVO> list=this.basketService.listBasket(basket_id);//장바구니 정보
		int sumMoney=this.basketService.sumMoney(basket_id);//장바구니 전체 금액 호출
		
		/* 장바구니 전체 금액에 따라 배송비 구분 */
		
		
		try {
//			entity=new ResponseEntity<>(
//				this.basketService.listBasket(basket_id),HttpStatus.OK);
			
		}catch(Exception e) {
			e.printStackTrace();
//			entity=new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}//try catch
		
		return map;
	}//basketList()
	
	/** 장바구니 수량 수정 **/
	
	/** 장바구니 상품 삭제 **/
}



















