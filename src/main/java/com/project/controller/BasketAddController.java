package com.project.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.project.service.BasketService;
import com.project.vo.BasketVO;

/** 장바구니 컨트롤러 **/
@RestController
public class BasketAddController {
	
	@Autowired
	private BasketService buyService;
	
	/** 장바구니에 추가 **/
	@RequestMapping(value="/shop/basket_add",method=RequestMethod.POST)
	public ResponseEntity<String> basket_add(
			@RequestBody BasketVO basket) throws Exception {
		
		/* session id 값이 있을 때 장바구니추가 활성화시켜야 함(session으로 수정할것) */
//		response.setContentType("text/html;charset=UTF-8");
//		PrintWriter out=response.getWriter();
		
//		String basket_id=request.getParameter("basket_id");
//		int product_no=Integer.parseInt(request.getParameter("product_no"));
//		int basket_count=Integer.parseInt(request.getParameter("basket_count"));
		
		ResponseEntity<String> entity=null;
		
		if(basket.getBasket_id() == null) {//id 값이 없을 때
//			out.println("<script>");
//			out.println("alert('다시 로그인 해주세요.');");
//			out.println("location='history.back();';");
//			out.println("</script>");
			
		}else {//id 값이 있을 때
//			basket.setBasket_id(basket_id); basket.setProduct_no(product_no);
//			basket.setBasket_count(basket_count);
			
//			this.buyService.addBasket(basket);//장바구니에 상품 추가
			try {
				this.buyService.addBasket(basket);//장바구니에 상품 추가
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
	
}



















