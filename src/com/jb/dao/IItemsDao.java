package com.jb.dao;

import java.util.List;
import java.util.Set;

import com.jb.pojo.Cart;
import com.jb.pojo.Items;

public interface IItemsDao {

	//添加items
	public void addItems(Set<Items> item);
	//根据Cart查询items,返回一个list
	public List<Items> getItemsByCart(Cart cart);
	//根据Cart删除items
	public String delItemsByCart(Cart cart);
	//根据id查询item
	public Items obtainItemsById(Integer id);
}
