package com.jb.buz;

import java.util.List;

import com.jb.pojo.Cart;
import com.jb.pojo.Items;

public interface IItemsBuz {

	//根据Cart查询items,返回一个list
	public List<Items> getItemsByCart(Cart cart);
	//根据id查询item
	public Items obtainItemsById(Integer id);
}
