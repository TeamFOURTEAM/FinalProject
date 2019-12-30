package com.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.vo.QandAVO;

@Repository
public class QandADOAImpl implements QandADOA {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertQandA(QandAVO q) {
		this.sqlSession.insert("QandA.QandA_in",q);
	}//게시판 저장

	@Override
	public int getListCount(QandAVO q) {
		return this.sqlSession.selectOne("QandA.QandA_count",q);
	}//검색 전후 레코드 개수

	@Override
	public List<QandAVO> getQandAList(QandAVO q) {
		return this.sqlSession.selectList("QandA.QandA_list",q);
	}
}
