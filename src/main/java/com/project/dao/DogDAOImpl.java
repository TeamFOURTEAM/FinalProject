package com.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.vo.DogVO;

@Repository
public class DogDAOImpl implements DogDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertDog(DogVO d) {
		this.sqlSession.insert("Dog.dog_in", d);
	}//글쓰기 저장

	@Override
	public int getListCount(DogVO d) {
		return this.sqlSession.selectOne("Dog.dog_count", d);
	}//검색 전후 레코드 개수

	@Override
	public List<DogVO> getDogList(DogVO d) {
		return this.sqlSession.selectList("Dog.dog_list",d);
	}//검색 전후 글쓰기 전체 목록

	@Override
	public DogVO getDogCont(int dog_no) {
		return this.sqlSession.selectOne("Dog.dog_cont", dog_no);
	}//내용 보기

	@Override
	public void editDog(DogVO d) {
		this.sqlSession.update("Dog.dog_edit",d);
	}//수정

	@Override
	public void delDog(int dog_no) {
		this.sqlSession.delete("Dog.dog_del",dog_no);
	}//삭제

/*	//고양이(먼치킨)
	@Override
	public int getListCount_mun(CatVO c_mun) {
		return this.sqlSession.selectOne("Cat.cat_mun_count", c_mun);
	}//검색 전후 레코드 개수

	@Override
	public List<CatVO> getCatList_mun(CatVO c_mun) {
		return this.sqlSession.selectList("Cat.cat_mun_list",c_mun);
	}*/
}
