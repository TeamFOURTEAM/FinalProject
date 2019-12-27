package com.project.vo;

/** shop 장바구니 VO **/
public class BasketVO {
	
	private int basket_no;//장바구니 상품 번호
	private String basket_id;//유저 아이디
	private int product_no;//원래 상품 번호
	private int basket_count;//담은 상품 개수
	private int validity;//상품의 상태. 1-> 장바구니에 담긴 상품, 2-> 주문완료 처리 된 상품
	
	private int price;//상품 개별 가격
	private int price_sum;//총 가격
	
	
	
	/** getter // setter **/
	public int getBasket_no() {
		return basket_no;
	}
	public void setBasket_no(int basket_no) {
		this.basket_no = basket_no;
	}
	public String getBasket_id() {
		return basket_id;
	}
	public void setBasket_id(String basket_id) {
		this.basket_id = basket_id;
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
	public int getValidity() {
		return validity;
	}
	public void setValidity(int validity) {
		this.validity = validity;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getPrice_sum() {
		return price_sum;
	}
	public void setPrice_sum(int price_sum) {
		this.price_sum = price_sum;
	}
	
	
	
}
