package com.project.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.vo.MemberVO;

@Repository
public class MemberJoinDAOImpl implements MemberJoinDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(MemberVO mb) {
		sqlSession.insert("MemberJoin.MbJoin", mb);
	}

}
