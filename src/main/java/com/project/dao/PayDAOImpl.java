package com.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.vo.PayVO;

@Repository
public class PayDAOImpl implements PayDAO{

	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
	public void insertPay(PayVO pay) {
		this.sqlSession.insert("pay_insert",pay);//주문목록에 추가
	}

	@Override
	public void updateBasket(String user_id) {
		this.sqlSession.update("bs_update",user_id);//장바구니 컬럼 업데이트(유효성+주문값)
	}

	@Override
	public List<PayVO> list_pay(String user_id) {
		return this.sqlSession.selectList("pay_list",user_id);
	}//주문 내역 불러오기
	
}
