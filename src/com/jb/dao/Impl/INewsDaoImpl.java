package com.jb.dao.Impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.jb.dao.INewsDao;
import com.jb.pagination.Page;
import com.jb.pojo.News;

public class INewsDaoImpl extends HibernateDaoSupport implements INewsDao {

	//后台批量删除通告
	public int delNewsPatch(String[] nid){
		int flag = 0;
		for(String s:nid){
			int id = Integer.parseInt(s);
			News news = (News)getHibernateTemplate().get(News.class, id);
			getHibernateTemplate().delete(news);
			flag++;
		}
		return flag;
	}
	
	
	
	//后台分页显示通告
	@SuppressWarnings("unchecked")
	public List<News> getNewsByPage(Page page){
		Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
		session.getTransaction();
		Criteria criteria = session.createCriteria(News.class);
		criteria.setFirstResult(page.getBeginNum());
		criteria.setMaxResults(page.getPageSize());
		return criteria.list();
	}
	
	//添加news
	public void addNews(News news){
		Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
		session.getTransaction();
		try {
			session.save(news);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//删除某一通告
	public void delNews(Integer id){
		Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
		session.getTransaction();
		try {
			News news = (News)session.get(News.class, id);
			if(null!=news){
				session.delete(news);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//修改通告内容
	public void updateNews(News news){
		Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
		session.getTransaction();
		try {
			if(null!=news){
				session.saveOrUpdate(news);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//根据id查询通告
	public News getNewsById(Integer id){
		Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
		session.getTransaction();
		try {
			News news = (News)session.get(News.class, id);
			if(null!=news){
				return news;
			}
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
	//查询首页显示的通告list
	@SuppressWarnings("unchecked")
	public List<News> getListShowIndex(){
		Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
		session.getTransaction();
		Criteria c = session.createCriteria(News.class ); 
		Criterion ctn = Restrictions.eq("status", 1);
		c.setFirstResult(0);
		c.setMaxResults(4);
		c.add(ctn);
		c.addOrder(Order.desc("addTime"));
		return c.list();
	}
	
	//查询所有的通告
	@SuppressWarnings("unchecked")
	public List<News> getAllNews(){
		Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
		session.getTransaction();
		Criteria c = session.createCriteria(News.class ); 
		Criterion ctn = Restrictions.eq("status", 1);
		c.add(ctn);
		c.addOrder(Order.desc("addTime"));
		return c.list();
	}
}
