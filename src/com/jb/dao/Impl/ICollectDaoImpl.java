package com.jb.dao.Impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.jb.dao.ICollectDao;
import com.jb.pagination.Page;
import com.jb.pojo.Collect;
import com.jb.pojo.Goods;
import com.jb.pojo.User;

public class ICollectDaoImpl extends HibernateDaoSupport implements ICollectDao {

	//后台查询所有的收藏，根据用户list;
	@SuppressWarnings("unchecked")
	public List<Collect> obtainAllCollectByUserCollection(List<User> u_list,Page page){
		Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
		session.getTransaction();
		Criteria criteria = session.createCriteria(Collect.class);
		if(null!=u_list&&u_list.size()>0){
			Criterion restriction_eq = Restrictions.in("user", u_list);
			criteria.add(restriction_eq);
		}
		if(null!=page){
			criteria.setFirstResult(page.getBeginNum());
			criteria.setMaxResults(page.getPageSize());
		}
		return criteria.list();
	}
	
	//收藏一个商品
	public String addCollect(Collect c){
		Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
		session.getTransaction();
		try {
			session.save(c);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	//判断当前登录用户是否收藏过某一商品
	public boolean isCollectGoods(User u,Goods g){
		Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
		session.getTransaction();
		try {
			//创建QBC查询对象
			Criteria criteria = session.createCriteria(Collect.class);
			Criterion restriction_eq = Restrictions.eq("user", u);
			Criterion restriction_eqg = Restrictions.eq("goods", g);
			criteria.add(restriction_eq);
			criteria.add(restriction_eqg);
			if(criteria.list().size()>0){
				return true;
			}else{
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	//查询共有多少人收藏过某一商品
	public int getUserNumCollectTheGoods(Goods g){
		Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
		session.getTransaction();
		try {
			Criteria criteria = session.createCriteria(Collect.class);
			Criterion restriction_eq = Restrictions.eq("goods", g);
			criteria.add(restriction_eq);
			return criteria.list().size();
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	//查询当前用户所收藏的所有商品,按收藏时间排序
	@SuppressWarnings("unchecked")
	public List<Goods> getCollectList(User u){
		Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
		session.getTransaction();
		try {
			Criteria criteria = session.createCriteria(Collect.class);
			if(null!=u){
				Criterion restriction_eq = Restrictions.eq("user", u);
				criteria.add(restriction_eq);
			}
			criteria.addOrder(Order.desc("ctime"));
			return criteria.list();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	//分页查询当前用户所收藏的商品
	@SuppressWarnings("unchecked")
	public List<Goods> getCollectListByPage(Page page,User u){
		Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
		session.getTransaction();
		try {
			Criteria criteria = session.createCriteria(Collect.class);
			Criterion restriction_eq = Restrictions.eq("user", u);
			criteria.add(restriction_eq);
			criteria.setFirstResult(page.getBeginNum());
			criteria.setMaxResults(page.getPageSize());
			criteria.addOrder(Order.desc("ctime"));
			return criteria.list();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	//取消收藏某一商品
	public String deleteOneCollect(int id){
		Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
		session.getTransaction();
		try {
			Collect c = (Collect)session.get(Collect.class, id);
			if(null!=c){
				session.delete(c);
			}
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	//批量删除所收藏的商品
	public int deleteCollects(String[] str){
		int flag = 0;
		for(String s:str){
			int id = Integer.parseInt(s);
			Collect c = (Collect)getHibernateTemplate().get(Collect.class, id);
			if(null!=c){
				getHibernateTemplate().delete(c);
				flag++;
			}
		}
		return flag;
	}
	
	
}
