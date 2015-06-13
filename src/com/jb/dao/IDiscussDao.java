package com.jb.dao;

import java.util.List;

import com.jb.pagination.Page;
import com.jb.pojo.Discuss;
import com.jb.pojo.Goods;
import com.jb.pojo.Items;

public interface IDiscussDao {

	//保存评价
	public void addDiscuss(Discuss discuss);
	//根据item查询discuss
	public Discuss getDiscussByItems(Items item);
	//查询某一商品的所有评论
	public List<Discuss> getAllDiscussByGoods(Goods goods,String condition);
	//分页查询商品的评论
	public List<Discuss> getDiscussByPage(Goods goods,Page page,String condition);
	
}
