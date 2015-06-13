package com.jb.dao;

import com.jb.pojo.Cart;
import com.jb.pojo.User;

public interface ICartDao {

	//添加购物车
	public void addCart(Cart cart);
	//查询当前用户购物车里的商品
	public Cart getCartByUser(User user);
	//删除当前登录用户的Cart
	public String delCartByUser(User user);
	
}
