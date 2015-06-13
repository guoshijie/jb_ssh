package com.jb.buz;

import java.util.List;

import com.jb.pagination.Page;
import com.jb.pojo.Discuss;
import com.jb.pojo.Goods;

public interface IDiscussBuz {

	//保存评价
	public void addDiscuss(Discuss discuss);
	//查询某一商品的所有评论
	public List<Discuss> getAllDiscussByGoods(Goods goods,Integer condition);
	//分页查询商品的评论
	public List<Discuss> getDiscussByPage(Goods goods,Page page,Integer condition);
	
}
