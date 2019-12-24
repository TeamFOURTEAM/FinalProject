package com.project.dao;

import java.util.List;

import com.project.vo.DogVO;

public interface DogDAO {

	void insertDog(DogVO d);

	int getListCount(DogVO d);

	List<DogVO> getDogList(DogVO d);

	DogVO getDogCont(int dog_no);

	void editDog(DogVO d);

	void delDog(int dog_no);

	
/*	//고양이(먼치킨)
	int getListCount_mun(CatVO c_mun);

	List<CatVO> getCatList_mun(CatVO c_mun);*/
}
