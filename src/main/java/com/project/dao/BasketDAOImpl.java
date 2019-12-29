package com.project.dao;

import java.util.HashMap;
import java.util.Map;

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
	}//장바구니 추가

	@Override
	public int countBasket(int product_no, String basket_id) {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("product_no",product_no);
		map.put("basket_id",basket_id);
		return this.sqlSession.selectOne("basket_count",map);
	}//장바구니 동일 상품 확인

	@Override
	public void updateBasket(BasketVO basket) {
		this.sqlSession.update("basketSame_update",basket);
	}//장바구니 동일 상품 있을 시 갱신
	
}
