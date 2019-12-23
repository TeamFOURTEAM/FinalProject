package com.project.dao;

import java.util.List;

import com.project.vo.ShopVO;

public interface ShopDAO {

	void insertShop(ShopVO s);

	int getListCount(ShopVO s);

	List<ShopVO> getShopList(ShopVO s);

<<<<<<< HEAD
=======
	ShopVO getShopCont(int item_no);

>>>>>>> origin/JaeHyung
}
