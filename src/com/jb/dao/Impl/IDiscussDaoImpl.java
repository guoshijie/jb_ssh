package com.jb.dao.Impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.jb.dao.IDiscussDao;
import com.jb.pagination.Page;
import com.jb.pojo.Discuss;
import com.jb.pojo.Goods;
import com.jb.pojo.Items;

public class IDiscussDaoImpl extends HibernateDaoSupport implements IDiscussDao {

	//保存评价
	public void addDiscuss(Discuss discuss){
		getHibernateTemplate().save(discuss);
	}
	
	//根据item查询discuss
	public Discuss getDiscussByItems(Items item){
		Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
		session.getTransaction();
		//创建QBC查询对象
		Criteria criteria = session.createCriteria(Discuss.class);
		Criterion restriction_eq = Restrictions.eq("items", item);
		criteria.add(restriction_eq);
		@SuppressWarnings("unchecked")
		List<Discuss> list = criteria.list();
		if(null!=list&&list.size()>0){
			return list.get(0);
		}
		return null;
	}
	
	//查询某一商品的所有评论
	public List<Discuss> getAllDiscussByGoods(Goods goods,String condition){
		Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
		session.getTransaction();
		Criteria criteria = session.createCriteria(Discuss.class);
		Criterion restriction_eq = Restrictions.eq("goods", goods);
		criteria.add(restriction_eq);
		if(!condition.equals("所有")){
			Criterion restriction_eq1 = Restrictions.eq("grade", condition);
			criteria.add(restriction_eq1);
		}
		@SuppressWarnings("unchecked")
		List<Discuss> list = criteria.list();
		return list;
	}
	
	//分页查询商品的评论
	public List<Discuss> getDiscussByPage(Goods goods,Page page,String condition){
		Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
		session.getTransaction();
		Criteria criteria = session.createCriteria(Discuss.class);
		Criterion restriction_eq = Restrictions.eq("goods", goods);
		criteria.add(restriction_eq);
		if(!condition.equals("所有")){
			Criterion restriction_eq1 = Restrictions.eq("grade", condition);
			criteria.add(restriction_eq1);
		}
		criteria.setFirstResult(page.getBeginNum());
		criteria.setMaxResults(page.getPageSize());
		@SuppressWarnings("unchecked")
		List<Discuss> list = criteria.list();
		return list;
	}
	
}
