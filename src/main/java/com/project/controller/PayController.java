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
import com.project.service.PayService;
import com.project.vo.BasketVO;
import com.project.vo.PayVO;

@Controller
public class PayController {
	
	@Autowired
	private BasketService basketService;
	
	@Autowired
	private PayService payService;
	
	/** 결제페이지로 이동 **/
	@RequestMapping("shop/pay")
	public String pay(
			HttpServletRequest request,
			RedirectAttributes redirectAttributes) {
		
		int page = Integer.parseInt(request.getParameter("page"));
		redirectAttributes.addAttribute("page",page);
		
		return "redirect:/shop/pay_page";
	}//pay()
	
	
	/** 결제 페이지의 상품 목록 **/
	@RequestMapping("shop/pay_page")
	public String pay_list(
			BasketVO basket,
			HttpServletRequest request,
			HttpServletResponse response,
			Model basketList) throws Exception  {
		
		int page=1;
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));
		}//page 값 받아옴
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		//session 처리!
		String user_id = "pebble";
		
		if(user_id.equals(null)) {
			out.println("<script>");
			out.println("alert('로그인 하신 후 이용해주세요.');");
			out.println("location='admin_login';");
			out.println("</script>");
			
		}else {
			Map<String,Object> map=new HashMap<String, Object>();
			basket.setBasket_id(user_id); basket.setValidity(1);
			basket.setPay_no(0);
			List<BasketVO> list=this.basketService.listBasket(basket);//결제 페이지의 상품 정보
			//만약 유저정보도 뽑아올거면 여기서 메서드 돌리기 -> 회원아이디로 회원정보에서 이름 전번 이메일
			
			int sumMoney=this.basketService.sumMoney(basket);//결제 페이지의 상품 전체 금액 호출
			/* 장바구니 전체 금액에 따라 배송비 구분 */
			//배송료(10만원 이상 -> 무료, 미만 -> 2500원)
			int fee = sumMoney >= 100000 ? 0 : 2500;
			
			map.put("list",list); //장바구니 정보
			map.put("count",list.size());//장바구니 상품 유무
			map.put("sumMoney",sumMoney);//장바구니 합계 금액
			map.put("fee",fee);//배송비
			map.put("allSum",sumMoney+fee);//주문 총 합계 금액(상품 + 배송비)
			map.put("page",page);//페이지값전달
			
			basketList.addAttribute("map",map);
			
			return "shop/pay_page";

		}//if else 
		
		return null;
	}
	
	/** 결제완료 페이지 **/
	@RequestMapping("shop/pay_page_confirm")
	public String pay_page_confirm(
			HttpServletRequest request,
			Model m) {
		
		int page = Integer.parseInt(request.getParameter("page"));
		m.addAttribute("page",page);
		
		return "shop/pay_page_confirm";
	}//pay_page_confirm()
	
	/** 결제하기(주문 목록 추가) **/
	@RequestMapping("shop/pay_page_ok")
	public String pay_page_ok(
			HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		int page=1;
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));
		}//page 값 받아옴
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		//session 처리!
		String user_id = "pebble";
		
		if(user_id.equals(null)) {
			out.println("<script>");
			out.println("alert('로그인 하신 후 이용해주세요.');");
			out.println("location='admin_login';");
			out.println("</script>");
			
		}else {
			int pay_price=Integer.parseInt(request.getParameter("pay_price"));
			//총 결제 금액
			PayVO pay = new PayVO();
			pay.setUser_id(user_id); pay.setPay_price(pay_price);
			//유저 아이디와 결제 금액 저장
			
			this.payService.insertPay(pay,user_id);//주문 내역 추가,장바구니 업데이트
			//트랜잭션 적용
			
			return "redirect:/shop/pay_page_confirm?page="+page;
		}//if else 

		return null;
	}
	
	/** 주문 내역으로 이동 **/
	@RequestMapping("shop/pay_list_go")
	public String pay_list_go(
			HttpServletRequest request,
			RedirectAttributes redirectAttributes) {
		
		int page = Integer.parseInt(request.getParameter("page"));
		
		redirectAttributes.addAttribute("page",page);
		
		return "redirect:/shop/pay_list";
	}//pay_list_go()
	
	/** 구매 내역 **/
	@RequestMapping("shop/pay_list")
	public String pay_list(
			PayVO pay,
			HttpServletRequest request,
			HttpServletResponse response,
			Model payList) throws Exception {
		
		int page=1;
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));
		}//page 값 받아옴
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		//session 처리!
		String user_id = "pebble";
		
		if(user_id.equals(null)) {
			out.println("<script>");
			out.println("alert('로그인 하신 후 이용해주세요.');");
			out.println("location='admin_login';");
			out.println("</script>");
			
		}else {
			List<PayVO> list = this.payService.list_pay(user_id);//주문 내역 목록
			
			payList.addAttribute("user_id",user_id);//id값 전달
			payList.addAttribute("list",list);
			payList.addAttribute("page",page);
			
			return "shop/pay_list";
		}//if else
		
		return null;
	}//pay_list()
	
	/** 주문 상품명 클릭시, 해당 주문의 상품 리스트로 이동 **/
	@RequestMapping("shop/pay_item_list_go")
	public String pay_item_list_go(
			HttpServletRequest request,
			RedirectAttributes redirectAttributes) {
		
		int pay_no = Integer.parseInt(request.getParameter("pay_no"));
		int validity = Integer.parseInt(request.getParameter("validity"));
		
		redirectAttributes.addAttribute("pay_no",pay_no);
		redirectAttributes.addAttribute("validity",validity);
		
		return "redirect:/shop/pay_item_list";
	}//pay_item_list_go()
	
	@RequestMapping("shop/pay_item_list")
	public String pay_item_list(
			BasketVO basket,
			HttpServletRequest request,
			HttpServletResponse response,
			Model payItemList) throws Exception {
		
		int page=1;
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));
		}//page 값 받아옴
		
		int pay_no = Integer.parseInt(request.getParameter("pay_no"));
		//선택한 주문 번호
		int validity = Integer.parseInt(request.getParameter("validity"));
		//주문 내역의 validity. 1 -> 결제 확인중 , 2 -> 결제 확인 완료
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		//session 처리!
		String user_id = "pebble";
		
		if(user_id.equals(null)) {
			out.println("<script>");
			out.println("alert('로그인 하신 후 이용해주세요.');");
			out.println("location='admin_login';");
			out.println("</script>");
			
		}else {
			//1 -> 결제 확인 중인 장바구니 상품 리스트. 장바구니의 vali=2인 상품을 불러옴
			if(validity == 1) {//주문 내역의 validity가 1일 때(결제확인전)
				Map<String,Object> map=new HashMap<String, Object>();
				basket.setBasket_id(user_id); basket.setValidity(2);
				basket.setPay_no(pay_no);//주문내역 번호. 주문내역을 묶어서 
				//해당 주문 번호의 상품 목록만 보여주게끔 해주는 변수.
				List<BasketVO> list=this.basketService.listBasket(basket);//장바구니 정보
				//validity=2 인 장바구니 목록을 가져온다.
				
				int sumMoney=this.basketService.sumMoney(basket);//장바구니 전체 금액 호출
				/* 장바구니 전체 금액에 따라 배송비 구분 */
				//배송료(10만원 이상 -> 무료, 미만 -> 2500원)
				int fee = sumMoney >= 100000 ? 0 : 2500;
				
				map.put("list",list); //장바구니 정보
				map.put("count",list.size());//장바구니 상품 유무
				map.put("sumMoney",sumMoney);//장바구니 합계 금액
				map.put("fee",fee);//배송비
				map.put("allSum",sumMoney+fee);//주문 총 합계 금액(상품 + 배송비)
				
				payItemList.addAttribute("user_id",user_id);//id값 전달
				payItemList.addAttribute("page",page);//page 값 받아서 전달(목록버튼에 전달하기위함)
				payItemList.addAttribute("page",page);
				payItemList.addAttribute("map",map);
				
			
			//2 -> 결제 확인 끝난 장바구니 상품 리스트. 구매 확정 장바구니 테이블의 상품을 불러옴
			}else if(validity == 2) {//주문 내역의 validity가 2일 때(결제확인후)
				/** 작업 해줘야 함.  **/
				
			}//if else
			
			return "shop/pay_item_list";
		}//if else
		
		return null;
	}//pay_item_list()
	
	/** 관리자 주문 내역 **/
	@RequestMapping("shop/admin_paylist_go")
	public String admin_paylist_go() {
		
		return "redirect:/shop/admin_paylist?page=1&find_field=item_name&find_name=";
	}//admin_paylist_go()
	
	@RequestMapping("shop/admin_paylist")
	public String admin_paylist(
			Model m,PayVO pay,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		//session 처리!(관리자)
		String user_id = "pebble";
		
		if(user_id.equals(null)) {
			out.println("<script>");
			out.println("alert('관리자 영역입니다. 관리자 계정으로 로그인해주세요.');");
			out.println("location='admin_login';");
			out.println("</script>");
			
		}else {
			int page=1;
			int limit=6;//한페이지에 보여지는 상품 개수
			
			if(request.getParameter("page") != null) {
				page=Integer.parseInt(request.getParameter("page"));
			}
			String find_name = request.getParameter("find_name");
			String find_field = request.getParameter("find_field");
			//검색어, 검색필드 를 저장
			
			pay.setFind_field(find_field);
			pay.setFind_name("%"+find_name+"%");
				
			int totalCount=this.payService.getAdminPayListCount(pay);
			//검색전후 레코드 개수
			
			pay.setStartrow((page-1)*limit+1);//시작행번호
			pay.setEndrow(pay.getStartrow()+limit-1);//끝행 번호
			
			List<PayVO> payList=this.payService.getAdminPayList(pay);
			//검색 전후 목록
			
			//총 페이지 수
			int maxpage=(int)((double)totalCount/limit+0.95);
			
			//시작페이지
			int startpage=(((int)((double)page/10+0.9))-1)*6+1;
			
			//마지막 페이지
			int endpage=maxpage;
			
			if(endpage>startpage+6-1)
				endpage=startpage+6-1;
			
			m.addAttribute("payList",payList);
			m.addAttribute("page",page);
			m.addAttribute("startpage",startpage);
			m.addAttribute("endpage",endpage);
			m.addAttribute("maxpage",maxpage);
			m.addAttribute("totalcount",totalCount);
			m.addAttribute("find_field",find_field);
			m.addAttribute("find_name",find_name);
			
			return "shop/shop_admin_paylist";
		}//if else
		
		return null;
	}//admin_paylist()
}

















