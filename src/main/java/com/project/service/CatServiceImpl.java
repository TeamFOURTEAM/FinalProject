package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.CatDAO;
import com.project.vo.CatVO;

@Service
public class CatServiceImpl implements CatService {

	@Autowired
	private CatDAO catDao;

	@Override
	public void insertCat(CatVO c) {
		this.catDao.insertCat(c);
	}

	@Override
	public int getListCount(CatVO c) {
		return this.catDao.getListCount(c);
	}

	@Override
	public List<CatVO> getCatList(CatVO c) {
		return this.catDao.getCatList(c);
	}

	@Override
	public CatVO getCatCont(int cat_no) {
		return this.catDao.getCatCont(cat_no);
	}

	@Override
	public CatVO getCatCont2(int cat_no) {
		return this.catDao.getCatCont(cat_no);
	}//수정폼 + 삭제폼

	@Override
	public void editCat(CatVO c) {
		this.catDao.editCat(c);
	}//수정

	@Override
	public void delCat(int cat_no) {
		this.catDao.delCat(cat_no);
	}//삭제

	//고양이(먼치킨)
	@Override
	public int getListCount_mun(CatVO c_mun) {
		return this.catDao.getListCount_mun(c_mun);
	}

	@Override
	public List<CatVO> getCatList_mun(CatVO c_mun) {
		return this.catDao.getCatList_mun(c_mun);
	}
}
