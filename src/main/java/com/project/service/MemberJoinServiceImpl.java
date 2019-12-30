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
	public void insert(MemberVO mb) {
		mbDAO.insert(mb);
	}

	@Override
	public String SearchID(String checkwords) {
		return mbDAO.SearchID(checkwords);
	}

}
