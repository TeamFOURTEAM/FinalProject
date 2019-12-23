package com.project.dao;

import java.util.List;

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
		this.sqlSession.insert("Shop.shop_insert",s);
	}//shop 페이지 상품 저장

	@Override
	public int getListCount(ShopVO s) {
		return this.sqlSession.selectOne("Shop.shop_count",s);
	}//shop 페이지 검색 전후 레코드 개수

	@Override
	public List<ShopVO> getShopList(ShopVO s) {
		return this.sqlSession.selectList("Shop.shop_list",s);
	}//shop 페이지 상품 전체 목록
	
	
}
