package com.project.dao;

import com.project.vo.PayVO;

public interface PayDAO {

	void insertPay(PayVO pay);

	void updateBasket(String user_id);

}
