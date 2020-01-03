package com.project.service;

import java.util.List;

import com.project.vo.PayVO;
import com.project.vo.PayokVO;
import com.project.vo.ShopVO;

public interface PayService {

	void insertPay(PayVO pay,String user_id);

	List<PayVO> list_pay(String user_id);

	int getAdminPayListCount(PayVO pay);

	List<PayVO> getAdminPayList(PayVO pay);

	void payConfirm(PayVO pay);
	
	List<PayokVO> stockView(int pay_no);

	void sendConfirm(PayVO pay,List<PayokVO> stockView,ShopVO s);


}
