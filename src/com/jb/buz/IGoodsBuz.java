package com.jb.buz;

import java.util.List;
import java.util.Map;

import com.jb.pagination.Page;
import com.jb.pojo.Category;
import com.jb.pojo.Goods;

public interface IGoodsBuz {
	
	//前台首页   热评商品
	public List<Goods> getHighDiscuss();
	//前台首页   礼品箱包
	public List<Goods> getGiftBags();
	//前台首页   外设产品
	public List<Goods> getComputerParts();
	//前台首页   体育用品
	public List<Goods> getSportsGoods();
	//前台首页   手机数码
	public List<Goods> getPhoneAndDigital();
	//前台首页   家用电器
	public List<Goods> getAppliance();
	//后台采购某商品
	public String addGoodsNum(Integer gid,Integer num);
	//后台更新商品信息
	public String updateGoods(Goods newGoods);
	//后台按条件查询所有商品
	public List<Goods> getAllGoodsByCondition(String categoryId,String keyword,String orderby);
	//后台根据商品的status查看商品,分页显示
	public List<Goods> getStorageGoodsByPage(Page page,Integer status);
	//根据商品的status来查询相应的商品列表
	public List<Goods> getAllStorageGoods(Integer status);
	//后台批量上架选中商品
	public boolean putaway(String[] gidArray);
	//后台批量下架选中商品
	public boolean removeOffGoodsPatch(String[] gidArray);
	//后台商品管理，分页显示商品
	public List<Goods> getGoodsByPage(Page page,String categoryId,String keyword,String orderby);
	//查询所有商品
	public List<Goods> getAllGoods();
	//查询某三级类型下的所有商品
	public List<Goods> queryGoodsListByThreeLevel(List<Category> category,String sort,Map<String,Object> conditions);
	//添加商品
	public void addGoods(Goods goods);
	//获得首页底部8件商品
	public List<Goods> getGoods();
	//直通车
	public List<Goods> getZhiTongChe();
	//根据id查询某一商品的详细信息
	public Goods getGoodsById(int gid);
	//查询商品表，按销量排序
	public List<Goods> getGoodsListOrderBySnum();
	//查询商品表，按发布时间排序
	public List<Goods> getGoodsListOrderByPubTime();
	//多条件查询商品
	public List<Goods> queryGoodsByConditions(Map<String,Object> conditions,String sort);
	
}
