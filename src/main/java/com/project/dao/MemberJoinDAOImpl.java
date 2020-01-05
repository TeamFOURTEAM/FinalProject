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

	@Override
	public String SearchID(String checkwords) {
		System.out.println("DAO에서 Query에 값 전달 : "+checkwords);
		return sqlSession.selectOne("MemberJoin.SearchID", checkwords);		
	}

	@Override
	public MemberVO MypageView(MemberVO mVo) {
		return sqlSession.selectOne("MemberJoin.MyPageInfo", mVo);
	}

	@Override
	public int UserInfoEmail(MemberVO updateMember) {
		System.out.println(updateMember.getUser_id()+"/"+updateMember.getUser_email());
		return sqlSession.update("MemberJoin.updateEmail", updateMember);
	}

	@Override
	public int UserInfoPhone(MemberVO updateMember) {
		return sqlSession.update("MemberJoin.updatePN",updateMember);
	}

}
