package com.jb.dao;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.jb.pagination.Page;
import com.jb.pojo.Category;
import com.jb.pojo.Goods;
import com.jb.pojo.Items;

public interface IGoodsDao {
	
	//后台销量统计，为饼状图准备数据
	public List<Goods> getPieData();
	//后台更新商品信息
	public String updateGoods(Goods goods);
	//后台按条件查询所有商品
	public List<Goods> getAllGoodsByCondition(Category category,String keyword,String orderby);
	//后台根据商品的status查看商品,分页显示
	public List<Goods> getStorageGoodsByPage(Page page,Integer status);
	//根据商品的status来查询相应的商品列表
	public List<Goods> getAllStorageGoods(Integer status);
	//后台批量上架选中商品
	public int putaway(String[] gidArray);
	//后台批量下架选中商品
	public int removeOffGoodsPatch(String[] gidArray);
	//后台商品管理，分页显示商品
	public List<Goods> getGoodsByPage(Page page,Category category,String keyword,String orderby);
	//查询所有商品
	public List<Goods> getAllGoods();
	//查询某三级类型下的所有商品
	public List<Goods> queryGoodsListByThreeLevel(List<Category> categorylist,String sort,Map<String,Object> conditions);
	//发布商品
	public String addGoods(Goods goods);
	//获得首页底部8件商品
	public List<Goods> getGoods();
	//获得直通车的两件商品
	public List<Goods> getZhiTongChe();
	//根据id查询某一商品的详细信息
	public Goods getGoodsById(int gid);
	//更新商品表里的库存及销量
	public void updateGoodsNums(Set<Items> set);
	//查询商品表，按销量排序
	public List<Goods> getGoodsListOrderBySnum();
	//查询商品表，按发布时间排序
	public List<Goods> getGoodsListOrderByPubTime();
	//多条件查询商品
	public List<Goods> queryGoodsByConditions(Map<String,Object> conditions,List<Category> categoryList,String sort);
	//按三级类型查询
	public List<Goods> getGoodsListByThreeLevel(List<Category> category);
}
