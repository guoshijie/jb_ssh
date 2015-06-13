package com.jb.dao;

import java.util.List;

import com.jb.pagination.Page;
import com.jb.pojo.Address;
import com.jb.pojo.Order;
import com.jb.pojo.User;

public interface IOrderDao {

	//前台订单回收站恢复订单，即将定单的status设为1
	public int putawayOrders(String oid,Integer status);
	//后台批量删除选中定单
	public int delOrdersPatch(String[] oidArray);
	//后台订单管理中查询所有订单，并分页显示，按下单时间降序排序
	public List<Order> getAllOrdersByPage(Page page,List<User> userList,Integer status);
	//保存定单
	public void addOrder(Order order);
	//查询当前登录用户的所有订单
	public List<Order> obtainAllOrdersByUser(User user,Integer status);
	//分页查询当前登录用户的订单
	public List<Order> obtainOrderListByPage(Page page,User user,Integer status);
	//给定一个user集合，查询出该集合中所有user的定单
	public List<Order> obtainAllOrderByUserCollection(List<User> ulist,Integer status);
	//订单表中是否引用某地址
	public boolean checkOrderAddress(Address address);
}
