package com.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.BasketDAO;
import com.project.vo.BasketVO;

@Service
public class BasketServiceImpl implements BasketService{

	@Autowired
	private BasketDAO basketDAO;
	
	@Override
	public void addBasket(BasketVO basket) {
		this.basketDAO.addBasket(basket);
	}

}
