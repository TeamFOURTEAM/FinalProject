package com.project.dao;

import java.util.List;

import com.project.vo.BasketVO;

public interface BasketDAO {

	void addBasket(BasketVO basket);

	int countBasket(int product_no, String basket_id);

	void updateBasket(BasketVO basket);

	List<BasketVO> listBasket(String basket_id);

}
