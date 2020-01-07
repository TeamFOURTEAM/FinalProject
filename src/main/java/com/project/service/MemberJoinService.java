package com.project.service;

import com.project.vo.MemberVO;

public interface MemberJoinService {

	void insert(MemberVO mb);

	String SearchID(String checkwords);

	MemberVO MypageView(MemberVO mVo);

	int UserInfoEmail(MemberVO updateMember);

	int UserInfoPhone(MemberVO updateMember);

}
