package com.project.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.vo.BasketVO;

@Repository
public class BasketDAOImpl implements BasketDAO {
	
	@Autowired
	private SqlSession sqlSession; 
	
	@Override
	public void addBasket(BasketVO basket) {
		this.sqlSession.insert("basket_add",basket);
	}
	
}
