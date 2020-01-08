package com.project.dao;

import com.project.vo.MemberVO;

public interface MemberJoinDAO {

	int insert(MemberVO mb);

	String SearchID(String searchwords);

	MemberVO MypageView(MemberVO mVo);

	int UserInfoEmail(MemberVO updateMember);

	int UserInfoPhone(MemberVO updateMember);
	
	

}
