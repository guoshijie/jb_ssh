package com.jb.buz;

import java.util.List;
import java.util.Map;

import com.jb.pojo.Cart;
import com.jb.pojo.Goods;
import com.jb.pojo.Items;
import com.jb.pojo.User;

public interface ICartBuz {

	//将商品添加到购物车map里
	public Map<Integer,Items> addGoodsToCart(Goods goods,Map<Integer,Items> map);
	//计算购物车map里所有商品的总价
	public Double getCartSumPrice(Map<Integer,Items> map);
	//计算购物车map里总共有多少件商品
	public Integer getCartGoodsSumCount(Map<Integer,Items> map);
	//从购物车session里减去一个商品
	public Map<Integer,Items> cutGoodsToCart(Goods goods,Map<Integer,Items> map);
	//从购物车中删除某商品
	public Map<Integer,Items> delGoodsFormCart(Integer gid,Map<Integer,Items> map);
	//从购物车中批量删除某商品
	public Map<Integer,Items> delGoodsFormCart(String[] gid_array,Map<Integer,Items> map);
	//提取出购物车map里勾选要下单的商品，并放入一个session中，把剩下的放入原来的session中
	public List<Map<Integer,Items>> obtainOrderMapAndNoOrderMap(String[] gid_array,Map<Integer,Items> map);
	//将购物车里剩余的未结账的商品添加到购物车
	public void addItemsToCart(Map<Integer,Items> oldCart,User u,Double sumPrice);
	//查询当前用户购物车里的商品
	public Cart getCartByUser(User user);
	//用户登录后，初始化登录用户的购物车map
	public Map<Integer,Items> initCartMap(List<Items> list);
	//删除当前登录用户的cart及其items
	public void delCartByUser(User u);
	//商品详情页面，点击立即购买，所调用的方法
	public Map<Integer,Items> buyNow(Goods g);
	
}
