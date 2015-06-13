package com.jb.dao.Impl;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.jb.dao.ICartDao;
import com.jb.pojo.Cart;
import com.jb.pojo.User;

public class ICartDaoImpl extends HibernateDaoSupport implements ICartDao {

	//添加购物车
	public void addCart(Cart cart){
		//getHibernateTemplate().save(cart);
		Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
		session.getTransaction();
		Cart cart2 = getCartByUser(cart.getUser());
		if(null!=cart2&&cart2.getUser().equals(cart.getUser())){
			cart2.setMoney(cart.getMoney());
			getHibernateTemplate().saveOrUpdate(cart2);
		}else{
			getHibernateTemplate().save(cart);
		}
		
	}
	
	//查询当前用户购物车里的商品
	public Cart getCartByUser(User user){
		Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
		session.getTransaction();
		//创建QBC查询对象
		Criteria criteria = session.createCriteria(Cart.class);
		
		Criterion restriction_eq = Restrictions.eq("user", user);
		criteria.add(restriction_eq);
		if(criteria.list().size()>0){
			return (Cart)criteria.list().get(0);
		}else{
			return null;
		}
	}
	
	//删除当前登录用户的Cart
	public String delCartByUser(User user){
		Cart cartByUser = getCartByUser(user);
		getHibernateTemplate().delete(cartByUser);
		return "success";
	}
}
