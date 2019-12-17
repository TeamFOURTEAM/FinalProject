package com.project.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.vo.ShopVO;

@Repository
public class ShopDAOImpl implements ShopDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertShop(ShopVO s) {
		this.sqlSession.insert("shop_insert",s);
	}
	
	
}
