package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.DogDAO;
import com.project.vo.DogVO;


@Service
public class DogServiceImpl implements DogService {

	@Autowired
	private DogDAO dogDao;
	
	@Override
	public void insertDog(DogVO d) {
		this.dogDao.insertDog(d);
	}

	@Override
	public int getListCount(DogVO d) {
		return this.dogDao.getListCount(d);
	}

	@Override
	public List<DogVO> getDogList(DogVO d) {
		return this.dogDao.getDogList(d);
	}

	@Override
	public DogVO getDogCont(int dog_no) {
		return this.dogDao.getDogCont(dog_no);
	}

	@Override
	public DogVO getDogCont2(int dog_no) {
		return this.dogDao.getDogCont(dog_no);
	}//수정폼 + 삭제폼

	@Override
	public void editDog(DogVO d) {
		this.dogDao.editDog(d);
	}//수정

	@Override
	public void delDog(int dog_no) {
		this.dogDao.delDog(dog_no);
	}//삭제

	/*//고양이(먼치킨)
	@Override
	public int getListCount_mun(CatVO c_mun) {
		return this.catDao.getListCount_mun(c_mun);
	}

	@Override
	public List<CatVO> getCatList_mun(CatVO c_mun) {
		return this.catDao.getCatList_mun(c_mun);
	}*/
}
