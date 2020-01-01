package com.project.service;

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

}
