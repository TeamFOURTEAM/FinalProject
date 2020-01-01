package com.project.vo;

/** shop 구매목록 VO **/
public class PayVO {
	
	private int pay_no;//구매목록 번호
	private String user_id;//구매자 아이디
	private int pay_price;//총 구매금액
	private String pay_date;//구매날짜
	private int validity;//판매 승인 여부. 판매승인전 -> 1, 판매승인후 -> 2
	public int getPay_no() {
		return pay_no;
	}
	public void setPay_no(int pay_no) {
		this.pay_no = pay_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getPay_price() {
		return pay_price;
	}
	public void setPay_price(int pay_price) {
		this.pay_price = pay_price;
	}
	public String getPay_date() {
		return pay_date;
	}
	public void setPay_date(String pay_date) {
		this.pay_date = pay_date.substring(0,10);
		//0이상 10미만 사이의 년,월,일 만 반환
	}
	public int getValidity() {
		return validity;
	}
	public void setValidity(int validity) {
		this.validity = validity;
	}

}
