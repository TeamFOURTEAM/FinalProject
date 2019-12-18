package com.project.vo;

/** shop 상품 목록 VO **/
public class ShopVO {
	
	private int item_no;
	private String item_name;
	private String item_sub;
	private String item_price;
	private String item_stockCount;
	private String item_cont;
	private String item_img;
	private String item_likeCount;
	
	
	/** 페이징 변수 **/
	private int startrow;//시작행 번호
	private int endrow;//끝행 번호
	
	/** 검색 필드와 검색어 **/
	private String find_field;
	private String find_name;
	
	public int getItem_no() {
		return item_no;
	}
	public void setItem_no(int item_no) {
		this.item_no = item_no;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public String getItem_sub() {
		return item_sub;
	}
	public void setItem_sub(String item_sub) {
		this.item_sub = item_sub;
	}
	public String getItem_price() {
		return item_price;
	}
	public void setItem_price(String item_price) {
		this.item_price = item_price;
	}
	public String getItem_stockCount() {
		return item_stockCount;
	}
	public void setItem_stockCount(String item_stockCount) {
		this.item_stockCount = item_stockCount;
	}
	public String getItem_cont() {
		return item_cont;
	}
	public void setItem_cont(String item_cont) {
		this.item_cont = item_cont;
	}
	public String getItem_img() {
		return item_img;
	}
	public void setItem_img(String item_img) {
		this.item_img = item_img;
	}
	public String getItem_likeCount() {
		return item_likeCount;
	}
	public void setItem_likeCount(String item_likeCount) {
		this.item_likeCount = item_likeCount;
	}
	public int getStartrow() {
		return startrow;
	}
	public void setStartrow(int startrow) {
		this.startrow = startrow;
	}
	public int getEndrow() {
		return endrow;
	}
	public void setEndrow(int endrow) {
		this.endrow = endrow;
	}
	public String getFind_field() {
		return find_field;
	}
	public void setFind_field(String find_field) {
		this.find_field = find_field;
	}
	public String getFind_name() {
		return find_name;
	}
	public void setFind_name(String find_name) {
		this.find_name = find_name;
	} 
}