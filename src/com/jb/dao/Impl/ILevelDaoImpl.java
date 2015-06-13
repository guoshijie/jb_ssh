package com.jb.dao.Impl;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.jb.dao.ILevelDao;
import com.jb.pojo.Level;

public class ILevelDaoImpl extends HibernateDaoSupport implements ILevelDao {

	public Level getLevel(int id){
		Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
		session.getTransaction();
		
		//创建QBC查询对象
		Criteria criteria = session.createCriteria(Level.class);
		
		Criterion restriction_eq = Restrictions.eq("id",  id);
		criteria.add(restriction_eq);
		return (Level)criteria.list().get(0);
	}
}
