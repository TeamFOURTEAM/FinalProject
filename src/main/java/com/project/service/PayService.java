package com.project.service;

import java.util.List;

import com.project.vo.PayVO;

public interface PayService {

	void insertPay(PayVO pay,String user_id);

	List<PayVO> list_pay(String user_id);

	int getAdminPayListCount(PayVO pay);

	List<PayVO> getAdminPayList(PayVO pay);

	void payConfirm(int pay_no);

}
