package com.jb.dao.Impl;

import java.util.List;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.jb.dao.IItemsDao;
import com.jb.pojo.Cart;
import com.jb.pojo.Items;

public class IItemDaoImpl extends HibernateDaoSupport implements IItemsDao {

	@Override
	//添加items
	public void addItems(Set<Items> item) {
		for(Items it:item){
			getHibernateTemplate().save(it);
		}
	}
	
	//根据Cart查询items,返回一个list
	@SuppressWarnings("unchecked")
	public List<Items> getItemsByCart(Cart cart){
		Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
		session.getTransaction();
		//创建QBC查询对象
		Criteria criteria = session.createCriteria(Items.class);
		
		Criterion restriction_eq = Restrictions.eq("cart", cart);
		criteria.add(restriction_eq);
		if(criteria.list().size()>0){
			return criteria.list();
		}else{
			return null;
		}
	}
	
	//根据Cart删除items
	public String delItemsByCart(Cart cart){
		Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
		session.getTransaction();
		List<Items> itemsByCart = getItemsByCart(cart);
		if(null!=itemsByCart){
			for(Items item:itemsByCart){
				getHibernateTemplate().delete(item);
			}
		}
		return "success";
	}
	
	//根据id查询item
	public Items obtainItemsById(Integer id){
		Items items = getHibernateTemplate().get(Items.class, id);
		return items;
	}

}
