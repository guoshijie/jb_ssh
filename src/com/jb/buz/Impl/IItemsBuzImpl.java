package com.jb.buz.Impl;

import java.util.List;

import com.jb.buz.IItemsBuz;
import com.jb.dao.IItemsDao;
import com.jb.pojo.Cart;
import com.jb.pojo.Items;

public class IItemsBuzImpl implements IItemsBuz {
	
	private IItemsDao iItemsDao;

	//根据Cart查询items,返回一个list
	public List<Items> getItemsByCart(Cart cart){
		return iItemsDao.getItemsByCart(cart);
	}
	
	//根据id查询item
	public Items obtainItemsById(Integer id){
		return iItemsDao.obtainItemsById(id);
	}
	
	
	public void setiItemsDao(IItemsDao iItemsDao) {
		this.iItemsDao = iItemsDao;
	}
}
