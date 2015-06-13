package com.jb.dao.Impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.jb.dao.IOrderDao;
import com.jb.pagination.Page;
import com.jb.pojo.Address;
import com.jb.pojo.Order;
import com.jb.pojo.User;

public class IOrderDaoImpl extends HibernateDaoSupport implements IOrderDao {
	
	//订单表中是否引用某地址
	public boolean checkOrderAddress(Address address){
		Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
		session.getTransaction();
		Criteria criteria = session.createCriteria(Order.class);
		criteria.add(Restrictions.eq("address", address));
		if(criteria.list().size()>0){
			return true;
		}else{
			return false;
		}
	}
	
	//前台订单回收站恢复订单，即将定单的status设为1
	public int putawayOrders(String oid,Integer status){
		int flag = 0;
		int id = Integer.parseInt(oid);
		Order o = (Order)getHibernateTemplate().get(Order.class, id);
		o.setStatus(status);
		getHibernateTemplate().saveOrUpdate(o);
		flag++;
		return flag;
	}
	
	//后台批量删除选中定单
	public int delOrdersPatch(String[] oidArray){
		int flag = 0;
		for(String s:oidArray){
			int id = Integer.parseInt(s);
			Order order = (Order)getHibernateTemplate().get(Order.class, id);
			order.setStatus(0);
			getHibernateTemplate().saveOrUpdate(order);
			flag++;
		}
		return flag;
	}
	
	//保存定单
	public void addOrder(Order order){
		getHibernateTemplate().save(order);
	}
	
	//后台订单管理中查询所有订单，并分页显示，按下单时间降序排序
	@SuppressWarnings("unchecked")
	public List<Order> getAllOrdersByPage(Page page,List<User> userList,Integer status){
		Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
		session.getTransaction();
		try {
			Criteria criteria = session.createCriteria(Order.class);
			if(null!=userList&&userList.size()>0){
				Criterion ctn = Restrictions.in("user", userList);
				criteria.add(ctn);
			}
			Criterion ctn = Restrictions.eq("status", status);
			criteria.add(ctn);
			criteria.addOrder(org.hibernate.criterion.Order.desc("otime"));
			criteria.setFirstResult(page.getBeginNum());
			criteria.setMaxResults(page.getPageSize());
			return criteria.list();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	//查询当前登录用户的所有订单
	public List<Order> obtainAllOrdersByUser(User user,Integer status){
		Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
		session.getTransaction();
		//创建QBC查询对象
		Criteria criteria = session.createCriteria(Order.class);
		Criterion ctn = Restrictions.eq("status", status);
		criteria.add(ctn);
		if(null!=user){
			Criterion restriction_eq = Restrictions.eq("user", user);
			criteria.add(restriction_eq);
		}
		if(criteria.list().size()>0){
			@SuppressWarnings("unchecked")
			List<Order> list= criteria.list(); 
			return list;
		}else{
			return null;
		}
	}
	
	//给定一个user集合，查询出该集合中所有user的定单
	public List<Order> obtainAllOrderByUserCollection(List<User> ulist,Integer status){
		Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
		session.getTransaction();
		//创建QBC查询对象
		Criteria criteria = session.createCriteria(Order.class);
		Criterion ctn = Restrictions.eq("status", status);
		criteria.add(ctn);
		if(ulist.size()>0){
			Criterion restriction_eq = Restrictions.in("user", ulist);
			criteria.add(restriction_eq);
		}else{
			return null;
		}
		if(criteria.list().size()>0){
			@SuppressWarnings("unchecked")
			List<Order> list= criteria.list(); 
			return list;
		}else{
			return null;
		}
	}
	
	//分页查询当前登录用户的订单
	@SuppressWarnings("unchecked")
	public List<Order> obtainOrderListByPage(Page page,User user,Integer status){
		Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
		session.getTransaction();
		try {
			Criteria criteria = session.createCriteria(Order.class);
			Criterion restriction_eq = Restrictions.eq("user", user);
			criteria.add(restriction_eq);
			Criterion ctn = Restrictions.eq("status", status);
			criteria.add(ctn);
			criteria.addOrder(org.hibernate.criterion.Order.desc("otime"));
			criteria.setFirstResult(page.getBeginNum());
			criteria.setMaxResults(page.getPageSize());
			return criteria.list();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
}
