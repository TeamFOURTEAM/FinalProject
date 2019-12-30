package com.project.service;

import com.project.vo.MemberVO;

public interface MemberJoinService {

	void insert(MemberVO mb);

	String SearchID(String checkwords);

}
