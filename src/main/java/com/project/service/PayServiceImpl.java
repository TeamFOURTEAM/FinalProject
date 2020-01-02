package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.dao.PayDAO;
import com.project.vo.PayVO;

@Service
public class PayServiceImpl implements PayService {

	@Autowired
	private PayDAO payDAO;
	
	@Transactional
	@Override
	public void insertPay(PayVO pay,String user_id) {
		this.payDAO.insertPay(pay);//주문내역 추가
		this.payDAO.updateBasket(user_id);//장바구니 validity 업데이트
	}//주문 내역 추가

	@Override
	public List<PayVO> list_pay(String user_id) {
		return this.payDAO.list_pay(user_id);
	}//주문 내역 불러옴

	@Override
	public int getAdminPayListCount(PayVO pay) {
		return this.payDAO.getAdminPayListCount(pay);
	}//관리자 주문 내역 레코드 개수

	@Override
	public List<PayVO> getAdminPayList(PayVO pay) {
		return this.payDAO.getAdminPayList(pay);
	}//관리자 주문 내역 목록 뽑아오기

}
