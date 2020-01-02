package com.project.dao;

import java.util.List;

import com.project.vo.PayVO;

public interface PayDAO {

	void insertPay(PayVO pay);

	void updateBasket(String user_id);

	List<PayVO> list_pay(String user_id);

	int getAdminPayListCount(PayVO pay);

	List<PayVO> getAdminPayList(PayVO pay);

}
