package com.project.dao;

import com.project.vo.MemberVO;

public interface MemberJoinDAO {

	void insert(MemberVO mb);

	String SearchID(String searchwords);
	
	

}
