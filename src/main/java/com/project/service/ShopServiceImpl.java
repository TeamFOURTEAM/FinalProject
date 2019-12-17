package com.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.ShopDAO;
import com.project.vo.ShopVO;

@Service
public class ShopServiceImpl implements ShopService {

	@Autowired
	private ShopDAO shopDAO;
	
	@Override
	public void insertShop(ShopVO s) {
		this.shopDAO.insertShop(s);
	}
}
