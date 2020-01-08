package com.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.MemberJoinDAO;
import com.project.vo.MemberVO;

@Service
public class MemberJoinServiceImpl implements MemberJoinService {

	@Autowired
	private MemberJoinDAO mbDAO;
	
	@Override
	public int insert(MemberVO mb) {
		return mbDAO.insert(mb);
	}

	@Override
	public String SearchID(String checkwords) {
		return mbDAO.SearchID(checkwords);
	}

	@Override
	public MemberVO MypageView(MemberVO mVo) {
		return mbDAO.MypageView(mVo);
	}


	@Override
	public int UserInfoEmail(MemberVO updateMember) {
		return mbDAO.UserInfoEmail(updateMember);
	}

	@Override
	public int UserInfoPhone(MemberVO updateMember) {
		return mbDAO.UserInfoPhone(updateMember);
	}

}
