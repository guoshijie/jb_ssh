package com.jb.buz.Impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.jb.buz.ICollectBuz;
import com.jb.dao.ICollectDao;
import com.jb.pagination.Page;
import com.jb.pojo.Collect;
import com.jb.pojo.Goods;
import com.jb.pojo.User;

public class ICollectBuzImpl implements ICollectBuz {
	
	private ICollectDao iCollectDao;
	private Collect collect;
	
	//后台查询所有的收藏，根据用户list;
	public List<Collect> obtainAllCollectByUserCollection(List<User> u_list,Page page){
		return iCollectDao.obtainAllCollectByUserCollection(u_list, page);
	}
	
	
	//收藏一商品
	public String addCollect(User user,Goods goods){
		collect.setGoods(goods);
		collect.setUser(user);
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = format.format(new Date());
		collect.setCtime(date);
		return iCollectDao.addCollect(collect);
	}
	
	//查询当前登录用户是否收藏到某一商品
	public boolean isCollectGoods(User u,Goods g){
		return iCollectDao.isCollectGoods(u, g);
	}
	
	//查询共有多少人收藏过某一商品
	public int getUserNumCollectTheGoods(Goods g){
		return iCollectDao.getUserNumCollectTheGoods(g);
	}
	
	//查询当前用户所收藏的所有商品
	public List<Goods> getCollectList(User u){
		return iCollectDao.getCollectList(u);
	}
	
	//分页查询当前用户所收藏的商品
	public List<Goods> getCollectListByPage(Page page,User u){
		return iCollectDao.getCollectListByPage(page, u);
	}
	
	//取消收藏某一商品
	public String deleteOneCollect(int id){
		return iCollectDao.deleteOneCollect(id);
	}
	
	//批量删除所收藏的商品
	public boolean deleteCollects(String[] str){
		int num = iCollectDao.deleteCollects(str);
		return num!=0?true:false;
	}
	
	public void setiCollectDao(ICollectDao iCollectDao) {
		this.iCollectDao = iCollectDao;
	}
	public void setCollect(Collect collect) {
		this.collect = collect;
	}
	
}
