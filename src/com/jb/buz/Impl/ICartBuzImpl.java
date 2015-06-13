package com.jb.buz.Impl;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.jb.buz.ICartBuz;
import com.jb.dao.ICartDao;
import com.jb.dao.IItemsDao;
import com.jb.pojo.Cart;
import com.jb.pojo.Goods;
import com.jb.pojo.Items;
import com.jb.pojo.User;

public class ICartBuzImpl implements ICartBuz {
	
	private ICartDao iCartDao;
	private IItemsDao iItemsDao;
	
	//商品详情页面，点击立即购买，所调用的方法
	public Map<Integer,Items> buyNow(Goods g){
		Map<Integer,Items> newCart = new HashMap<Integer,Items>();
		Items item = new Items();
		item.setGoods(g);
		item.setNum(1);
		item.setAmount(g.getSprice()*item.getNum());
		newCart.put(g.getGid(), item);
		return newCart;
	}

	//将商品添加到购物车map里
	public Map<Integer,Items> addGoodsToCart(Goods goods,Map<Integer,Items> map){
		DecimalFormat df = new DecimalFormat("#.00");
		Map<Integer,Items> newCart = new HashMap<Integer,Items>();
		newCart = map;
		if(null==newCart.get(goods.getGid())){
			Items item = new Items();
			item.setGoods(goods);
			item.setNum(1);
			item.setAmount(goods.getSprice()*item.getNum());
			newCart.put(goods.getGid(), item);
		}else{
			Items it = newCart.get(goods.getGid());
			it.setNum(it.getNum()+1);
			Double itemSum = goods.getSprice()*it.getNum();
			itemSum = Double.parseDouble(df.format(itemSum));
			it.setAmount(itemSum);
			newCart.put(goods.getGid(), it);
		}
		System.out.println("购物车中的商品：");
		printMap(newCart);
		return newCart;
	}
	
	//从购物车session里减去一个商品
	public Map<Integer,Items> cutGoodsToCart(Goods goods,Map<Integer,Items> map){
		DecimalFormat df = new DecimalFormat("#.00");
		Map<Integer,Items> newCart = new HashMap<Integer,Items>();
		newCart = map;
		if(null==newCart.get(goods.getGid())){

		}else{
			Items it = newCart.get(goods.getGid());
			it.setNum(it.getNum()-1);
			if(it.getNum()>0){
				Double itemSum = goods.getSprice()*it.getNum();
				itemSum = Double.parseDouble(df.format(itemSum));
				it.setAmount(itemSum);
				newCart.put(goods.getGid(), it);
			}
			
		}
		return newCart;
	}
	
	//计算购物车map里所有商品的总价
	public Double getCartSumPrice(Map<Integer,Items> map){
		DecimalFormat df = new DecimalFormat("#.00");
		Double sumPrice = 0.00;
		Set<Integer> key = map.keySet();
		for(Object item:key){
			Items itm = map.get(item);
			sumPrice += itm.getAmount();
		}
		sumPrice = Double.parseDouble(df.format(sumPrice));
		return sumPrice;
	}
	
	//计算购物车map里总共有多少件商品
	public Integer getCartGoodsSumCount(Map<Integer,Items> map){
		Integer sumCount = 0;
		Set<Integer> key = map.keySet();
		for(Object item:key){
			Items itm = map.get(item);
			sumCount += itm.getNum();
		}
		return sumCount;
	}
	
	//从购物车中删除某商品
	public Map<Integer,Items> delGoodsFormCart(Integer gid,Map<Integer,Items> map){
		Map<Integer,Items> newMap = new HashMap<Integer,Items>();
		Set<Integer> key = map.keySet();
		for(Integer o:key){
			if(gid.intValue()!=o.intValue()){
				newMap.put((Integer)o, map.get(o));
			}else{
				System.out.println(gid+"=="+o);
			}
		}
		return newMap;
	}
	
	//从购物车中批量删除某商品
	public Map<Integer,Items> delGoodsFormCart(String[] gid_array,Map<Integer,Items> map){
		Map<Integer,Items> newMap = new HashMap<Integer,Items>();
		newMap = map;
		String[] new_gidArray = gid_array[0].split(",");
		for(String s:new_gidArray){
			Integer gid = Integer.parseInt(s);
			if(null!=newMap.get(gid)){
				newMap.remove(gid);
			}
		}
		return newMap;
	}
	
	//提取出购物车map里勾选要下单的商品，并放入一个session中，把剩下的放入原来的session中
	public List<Map<Integer,Items>> obtainOrderMapAndNoOrderMap(String[] gid_array,Map<Integer,Items> map){
		List<Map<Integer,Items>> list = new ArrayList<Map<Integer,Items>>();
		Map<Integer,Items> new_Cart = new HashMap<Integer,Items>();
		Map<Integer,Items> old_Cart = new HashMap<Integer,Items>();
		String[] new_gidArray = gid_array[0].split(",");
		
		for(int i = 0;i< new_gidArray.length;i++){
			Integer gid = Integer.parseInt(new_gidArray[i]);
			Items items = map.get(gid);
			new_Cart.put(gid, items);
			map.remove(gid);
		}
		old_Cart = map;
		list.add(new_Cart);
		list.add(old_Cart);
		return list;
	}

	//将购物车里剩余的未结账的商品添加到购物车
	@SuppressWarnings("unchecked")
	public void addItemsToCart(Map<Integer,Items> oldCart,User u,Double sumPrice){
		//先删除原来的cart及其相关联的子items
		delCartByUser(u);
		//添加购物车里剩余的未结账的商品添加到购物车,和items
		Cart cart = new Cart();
		cart.setUser(u);
		cart.setMoney(sumPrice);
		Set<Items> itemses = new HashSet<Items>();
		Set<Integer> key = oldCart.keySet();
		for(Integer k:key){
			itemses.add(oldCart.get(k));
		}
		cart.setItemses(itemses);
		iCartDao.addCart(cart);
		Set<Items> itemses2 = setOidForItemses(cart, cart.getItemses());
		iItemsDao.addItems(itemses2);
	}
	
	public Set<Items> setOidForItemses(Cart cart,Set<Items> set){
		Set<Items> newSet = new HashSet<Items>();
		for(Items i:set){
			i.setCart(cart);
			newSet.add(i);
		}
		return newSet;
	}
	
	//删除当前登录用户的cart及其items
	public void delCartByUser(User u){
		Cart cartByUser = iCartDao.getCartByUser(u);
		if(null!=cartByUser){
			iItemsDao.delItemsByCart(cartByUser);
			iCartDao.delCartByUser(u);
		}
	}
	
	//查询当前用户购物车里的商品
	public Cart getCartByUser(User user){
		return iCartDao.getCartByUser(user);
	}
	
	//用户登录后，初始化登录用户的购物车map
	public Map<Integer,Items> initCartMap(List<Items> list){
		Map<Integer,Items> map = new HashMap<Integer,Items>();
		if(null!=list&&list.size()>0){
			for(Items item:list){
				Integer gid = item.getGoods().getGid();
				map.put(gid, item);
			}
		}
		return map;
	}
	
	
	//打印map
	@SuppressWarnings("rawtypes")
	public void printMap(Map map){
		Set key = map.keySet();
		for(Object o:key){
			System.out.println("key:"+o+"\tvalue:"+map.get(o));
		}
	}

	public void setiCartDao(ICartDao iCartDao) {
		this.iCartDao = iCartDao;
	}

	public void setiItemsDao(IItemsDao iItemsDao) {
		this.iItemsDao = iItemsDao;
	}
	
	
}
