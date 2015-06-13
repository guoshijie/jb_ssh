package com.jb.buz;

import java.util.List;
import java.util.Map;

import com.jb.pagination.Page;
import com.jb.pojo.Items;
import com.jb.pojo.Order;
import com.jb.pojo.User;

public interface IOrderBuz {

	//重载方法
	public boolean putawayOrders(String[] oid_array,Integer status);
	//前台订单回收站恢复订单，即将定单的status设为1
	public boolean putawayOrders(String oid,Integer status);
	//后台批量删除选中定单
	public boolean delOrdersPatch(String[] oidArray);
	//保存地址，和定单及items
	public boolean addOrder(Integer aid,Map<Integer,Items> newCart,User user,Double sumprice2);
	//查询当前登录用户的所有订单
	public List<Order> obtainAllOrdersByUser(User user,Integer status);
	//分页查询当前登录用户的订单
	public List<Order> obtainOrderListByPage(Page page,User user,Integer status);
	//计算当前登录用户的未评价数
	public Integer calculateTheNumNoDiscussItems(List<Order> list);
	//后台订单管理中查询所有订单，并分页显示，按下单时间降序排序
	public List<Order> getAllOrdersByPage(Page page,List<User> userList,Integer status);
	//给定一个user集合，查询出该集合中所有user的定单
	public List<Order> obtainAllOrderByUsersCollection(List<User> ulist,Integer status);
	
}
