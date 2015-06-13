package com.jb.buz.Impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.jb.buz.IDiscussBuz;
import com.jb.dao.IDiscussDao;
import com.jb.pagination.Page;
import com.jb.pojo.Discuss;
import com.jb.pojo.Goods;

public class IDiscussBuzImpl implements IDiscussBuz {
	
	private IDiscussDao iDiscussDao;

	//保存评价
	public void addDiscuss(Discuss discuss){
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = format.format(new Date());
		discuss.setDtime(date);
		iDiscussDao.addDiscuss(discuss);
	}
	
	//查询某一商品的所有评论
	public List<Discuss> getAllDiscussByGoods(Goods goods,Integer condition){
		switch (condition) {
		case 0:
			return iDiscussDao.getAllDiscussByGoods(goods,"所有");
		case 1:
			return iDiscussDao.getAllDiscussByGoods(goods,"好评");
		case 2:
			return iDiscussDao.getAllDiscussByGoods(goods,"中评");
		case 3:
			return iDiscussDao.getAllDiscussByGoods(goods,"差评");
		default:
			return null;
		}
		
	}
	
	//分页查询商品的评论
	public List<Discuss> getDiscussByPage(Goods goods,Page page,Integer condition){
		switch (condition) {
		case 0:
			return iDiscussDao.getDiscussByPage(goods, page,"所有");
		case 1:
			return iDiscussDao.getDiscussByPage(goods, page,"好评");
		case 2:
			return iDiscussDao.getDiscussByPage(goods, page,"中评");
		case 3:
			return iDiscussDao.getDiscussByPage(goods, page,"差评");
		default:
			return null;
		}
	}
	
	public void setiDiscussDao(IDiscussDao iDiscussDao) {
		this.iDiscussDao = iDiscussDao;
	}
	
	
}
