package com.project.dao;

import java.util.List;

import com.project.vo.QandAVO;

public interface QandADOA {

	void insertQandA(QandAVO q);

	int getListCount(QandAVO q);

	List<QandAVO> getQandAList(QandAVO q);

}
