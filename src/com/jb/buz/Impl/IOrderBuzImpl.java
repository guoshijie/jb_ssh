package com.jb.buz.Impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.jb.buz.IOrderBuz;
import com.jb.dao.IAddressDao;
import com.jb.dao.IDiscussDao;
import com.jb.dao.IGoodsDao;
import com.jb.dao.IItemsDao;
import com.jb.dao.IOrderDao;
import com.jb.dao.IUserDao;
import com.jb.pagination.Page;
import com.jb.pojo.Address;
import com.jb.pojo.Discuss;
import com.jb.pojo.Items;
import com.jb.pojo.Order;
import com.jb.pojo.User;
import com.jb.utils.FileUpUtils;

public class IOrderBuzImpl implements IOrderBuz {

	private IAddressDao iAddressDao;
	private IOrderDao iOrderDao;
	private IItemsDao iItemsDao;
	private Order order;
	private IDiscussDao iDiscussDao;
	private IGoodsDao iGoodsDao;
	private IUserDao iUserDao;
	
	//重载方法
	public boolean putawayOrders(String[] oid_array,Integer status){
		for(int i=0;i<oid_array.length;i++){
			 iOrderDao.putawayOrders(oid_array[i],status);
		}
		return true;
	}
	
	//前台订单回收站恢复订单，即将定单的status设为1
	public boolean putawayOrders(String oid,Integer status){
		int i = iOrderDao.putawayOrders(oid,status);
		if(i>0){
			return true;
		}
		return false;
	}
	
	//后台批量删除选中定单
	public boolean delOrdersPatch(String[] oidArray){
		int ordersPatch = iOrderDao.delOrdersPatch(oidArray);
		if(ordersPatch==oidArray.length){
			return true;
		}else{
			return false;
		}
	}
	
	
	//给定一个user集合，查询出该集合中所有user的定单
	public List<Order> obtainAllOrderByUsersCollection(List<User> ulist,Integer status){
		return iOrderDao.obtainAllOrderByUserCollection(ulist,status);
	}
	
	
	/**
	 * @param aid 地址id
	 * @param newCart 准备下单的items集合
	 * @param user 当前登录用户
	 * @param sumprice2 p定单总价
	 * @author guo_shijie
	 */
	//保存地址，和定单及items
	@SuppressWarnings("unchecked")
	public boolean addOrder(Integer aid,Map<Integer,Items> newCart,User user,Double sumprice2){
		if(user.getMoney()<sumprice2){
			return false;
		}else{
			Address address = iAddressDao.getAddressById(aid);
			String num = FileUpUtils.getTimeString();   
			num = "OR-"+user.getUid()+"-"+num;
			order.setAddress(address);
			order.setUser(user);
			order.setNum(num);	//设置定单编号
			order.setTotal(sumprice2); //设置定单总价
			
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String date = format.format(new Date());
			order.setOtime(date);	//设置下单时间
			
			Set<Items> itemses = new HashSet<Items>();
			Set<Integer> key = newCart.keySet();
			for(Integer i:key){
				itemses.add(newCart.get(i));
			}
			order.setItemses(itemses);
			iOrderDao.addOrder(order);
			Set<Items> set = setOidForItemses(order, order.getItemses());
			iItemsDao.addItems(set);
			//更新商品表里的库存及销量
			iGoodsDao.updateGoodsNums(set);
			//更新用户帐户余额
			iUserDao.updateUserMoney(sumprice2, user);
			return true;
		}
	}
	
	public Set<Items> setOidForItemses(Order order,Set<Items> set){
		Set<Items> newSet = new HashSet<Items>();
		for(Items i:set){
			i.setOrder(order);
			newSet.add(i);
		}
		return newSet;
	}
	
	//后台订单管理中查询所有订单，并分页显示，按下单时间降序排序
	public List<Order> getAllOrdersByPage(Page page,List<User> userList,Integer status){
		List<Order> allOrdersByPage = iOrderDao.getAllOrdersByPage(page,userList,status);
		return allOrdersByPage;
	}
	
	
	//查询当前登录用户的所有订单
	public List<Order> obtainAllOrdersByUser(User user,Integer status){
		List<Order> allOrderList =  iOrderDao.obtainAllOrdersByUser(user,status);
		List<Order> list = setDiscussforItems(allOrderList);
		return list;
	}
	
	//分页查询当前登录用户的订单
	public List<Order> obtainOrderListByPage(Page page,User user,Integer status){
		List<Order> orderPage = iOrderDao.obtainOrderListByPage(page, user,status);
		List<Order> list = setDiscussforItems(orderPage);
		return list;
	}
	
	public List<Order> setDiscussforItems(List<Order> l){
		List<Order> list = l;
		if(null!=list&&list.size()>0){
			for(Order o:list){
				@SuppressWarnings("unchecked")
				Set<Items> itemses = o.getItemses();
				for(Items item:itemses){
					Discuss discuss = iDiscussDao.getDiscussByItems(item);
					item.setDiscuss(discuss);
				}
			}
		}
		return list;
	}
	
	//计算当前登录用户的未评价数
	public Integer calculateTheNumNoDiscussItems(List<Order> list){
		Integer integer = 0;
		if(null!=list&&list.size()>0){
			for(Order o:list){
				@SuppressWarnings("unchecked")
				Set<Items> itemses = o.getItemses();
				for(Items item:itemses){
					if(null==item.getDiscuss()){
						integer++;
					}
				}
			}
		}
		return integer;
	}
	
	public void setiAddressDao(IAddressDao iAddressDao) {
		this.iAddressDao = iAddressDao;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public void setiOrderDao(IOrderDao iOrderDao) {
		this.iOrderDao = iOrderDao;
	}

	public void setiItemsDao(IItemsDao iItemsDao) {
		this.iItemsDao = iItemsDao;
	}

	public void setiDiscussDao(IDiscussDao iDiscussDao) {
		this.iDiscussDao = iDiscussDao;
	}

	public void setiGoodsDao(IGoodsDao iGoodsDao) {
		this.iGoodsDao = iGoodsDao;
	}

	public void setiUserDao(IUserDao iUserDao) {
		this.iUserDao = iUserDao;
	}
	
}
