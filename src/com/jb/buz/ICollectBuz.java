package com.jb.buz;

import java.util.List;

import com.jb.pagination.Page;
import com.jb.pojo.Collect;
import com.jb.pojo.Goods;
import com.jb.pojo.User;

public interface ICollectBuz {

	//后台查询所有的收藏，根据用户list;
	public List<Collect> obtainAllCollectByUserCollection(List<User> u_list,Page page);
	
	public String addCollect(User user,Goods goods);
	//查询当前登录用户是否收藏到某一商品
	public boolean isCollectGoods(User u,Goods g);
	//查询共有多少人收藏过某一商品
	public int getUserNumCollectTheGoods(Goods g);
	//查询当前用户所收藏的所有商品
	public List<Goods> getCollectList(User u);
	//分页查询当前用户所收藏的商品
	public List<Goods> getCollectListByPage(Page page,User u);
	//取消收藏某一商品
	public String deleteOneCollect(int id);
	//批量删除所收藏的商品
	public boolean deleteCollects(String[] str);
	
}
