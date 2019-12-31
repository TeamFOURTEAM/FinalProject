package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.BasketDAO;
import com.project.vo.BasketVO;

@Service
public class BasketServiceImpl implements BasketService{

	@Autowired
	private BasketDAO basketDAO;
	
	/** 장바구니 추가 **/
	@Override
	public void addBasket(BasketVO basket) {
		this.basketDAO.addBasket(basket);
	}

	/** 장바구니 수량 확인 **/
	@Override
	public int countBasket(int product_no, String basket_id) {
		return this.basketDAO.countBasket(product_no,basket_id);
	}

	/** 장바구니 수량 변경 **/
	@Override
	public void updateBasket(BasketVO basket) {
		this.basketDAO.updateBasket(basket);
	}
	
	/** 장바구니  목록 **/
	@Override
	public List<BasketVO> listBasket(String basket_id) {
		return this.basketDAO.listBasket(basket_id);
	}

	/** 장바구니 상품금액 합계 **/
	@Override
	public int sumMoney(String basket_id) {
		return this.basketDAO.sumMoney(basket_id);
	}

	/** 장바구니 정보 수정 **/
	@Override
	public void editBasket(BasketVO basket) {
		this.basketDAO.editBasket(basket);
	}
	
	
	
	
}
