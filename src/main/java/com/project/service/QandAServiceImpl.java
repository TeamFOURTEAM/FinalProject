package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.QandADOA;
import com.project.vo.QandAVO;

@Service
public class QandAServiceImpl implements QandAService {

	@Autowired
	private QandADOA QandDoa;

	@Override
	public void insertQandA(QandAVO q) {
		this.QandDoa.insertQandA(q);
	}

	@Override
	public int getListCount(QandAVO q) {
		return this.QandDoa.getListCount(q);
	}

	@Override
	public List<QandAVO> getQandAList(QandAVO q) {
		return this.QandDoa.getQandAList(q);
	}
}
