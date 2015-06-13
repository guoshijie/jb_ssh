package com.jb.dao.Impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.jb.dao.ICategoryDao;
import com.jb.pojo.Category;

public class ICategoryDaoImpl extends HibernateDaoSupport implements ICategoryDao{

	//获取某一类型的所有子类别
	@SuppressWarnings("unchecked")
	public List<Category> getChildList(Category category){
		Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
		session.getTransaction();
		Criteria c = session.createCriteria(Category.class );  //QBC
		Criterion restriction_eq = Restrictions.eq("category",  category);
		c.add(restriction_eq);
		return c.list();
	}
	
	//获取某一类型集合的所有子类别，返回集合
	@SuppressWarnings("unchecked")
	public List<Category> getChildListByCollection(List<Category> categoryList){
		Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
		session.getTransaction();
		Criteria c = session.createCriteria(Category.class );  //QBC
		Criterion restriction_eq = Restrictions.in("category",  categoryList);
		c.add(restriction_eq);
		return c.list();
	}
	
	//根据name查询category
	@SuppressWarnings("unchecked")
	public Category getCategoryByName(String name){
		Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
		session.getTransaction();
		Criteria c = session.createCriteria(Category.class );  //QBC
		Criterion restriction_eq = Restrictions.eq("name",  name);
		c.add(restriction_eq);
		List<Category> list = c.list();
		if(null!=list&&list.size()>0){
			return list.get(0);
		}
		return null;
	}
	
	//模糊匹配name返回List<Category>
	@SuppressWarnings("unchecked")
	public List<Category> getCategoryListFuzzyMatchingCname(String str){
		Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
		session.getTransaction();
		Criteria c = session.createCriteria(Category.class );
		Criterion eq = Restrictions.eq("level", 3);
		Criterion restriction_like = Restrictions.like("name", str , MatchMode.ANYWHERE ); 
		c.add(restriction_like);
		c.add(eq);
		return c.list();
	}
	
	//根据level查询某一级别的所有类型
	public List<Category> getCategoryListByLevel(Integer level){
		@SuppressWarnings("unchecked")
		List<Category> list = getHibernateTemplate().find("from Category where level = "+level);
		return list;
	}
	
	public String addType(Category category){
		getHibernateTemplate().save(category);
		return "添加类型成功";
	}
	
	//根据id查询商品类型
	public Category getCategory(int id){
		return getHibernateTemplate().get(Category.class, id);
	}
	
	//查询所有的商品类型
	public List<Category> getType(){
		@SuppressWarnings("unchecked")
		List<Category> list = getHibernateTemplate().find("from Category");
		return list;
	}
	
	//获取所有一级类别
	@SuppressWarnings("unchecked")
	public List<Category> getAllRootCategory(){
		List<Category> list = getHibernateTemplate().find("from Category where level = 1");
		return list;
	}
	
	public List<Category> getTypeById(int id){
		@SuppressWarnings("unchecked")
		List<Category> list = getHibernateTemplate().find("from Category where parent = "+id);
		return list;
	}
	
	public List<Category> getTypeInfo(){
		List<Category> newlist = new ArrayList<Category>();
		@SuppressWarnings("unchecked")
		List<Category> list = getHibernateTemplate().find("from Category where level = 1");
		Iterator<Category> iter = list.iterator();
		StringBuffer str = new StringBuffer();
		while(iter.hasNext()){
			Category c = (Category)iter.next();
			str = str.append(c.getLevel()).append(c.getName());
			newlist.add(c);
			getTypeChild(newlist,c.getId(),c.getLevel()+1);
			str = str.delete(0, str.length());
		}
		return newlist;
	}
	
	public void getTypeChild(List<Category> newlist,int id,int level){
		@SuppressWarnings("unchecked")
		List<Category> list = getHibernateTemplate().find("from Category where parent = "+id);
		Iterator<Category> iter = list.iterator();
		while(iter.hasNext()){
			Category c = iter.next();
			
			StringBuffer str = new StringBuffer();
			for(int i=1;i<level;i++){
				str.append("   ");
			}
			str = str.append(c.getLevel()).append(c.getName());
			newlist.add(c);
			str = str.delete(0, str.length());
			if(c.getLevel()!=1){
				getTypeChild(newlist,c.getId(),c.getLevel()+1);
			}
		}
	}
}
