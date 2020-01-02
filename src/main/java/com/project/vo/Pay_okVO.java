package com.project.vo;

/** 결제 확인, 완료 테이블 VO **/

public class Pay_okVO {
	
	private int payCom_no;//장바구니 번호
	private String payCom_id;//유저 아이디
	private int product_no;//상품번호
	private int basket_count;//담은 상품 수량
	private int product_page;//해당상품의 페이지 값. 장바구니에서 해당상품클릭했을때 이동하기 위함.
	
	public int getPayCom_no() {
		return payCom_no;
	}
	public void setPayCom_no(int payCom_no) {
		this.payCom_no = payCom_no;
	}
	public String getPayCom_id() {
		return payCom_id;
	}
	public void setPayCom_id(String payCom_id) {
		this.payCom_id = payCom_id;
	}
	public int getProduct_no() {
		return product_no;
	}
	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}
	public int getBasket_count() {
		return basket_count;
	}
	public void setBasket_count(int basket_count) {
		this.basket_count = basket_count;
	}
	public int getProduct_page() {
		return product_page;
	}
	public void setProduct_page(int product_page) {
		this.product_page = product_page;
	}
	
}



