package com.jb.dao.Impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.jb.dao.IAddressDao;
import com.jb.pojo.Address;
import com.jb.pojo.User;

public class IAddressDaoImpl extends HibernateDaoSupport implements IAddressDao {

	//添加收货地址
	public boolean addAddress(Address address){
		getHibernateTemplate().save(address);
		return true;
	}
	
	//查询当前用户的所有收货地址
	@SuppressWarnings("unchecked")
	public List<Address> getAddress(User u){
		Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
		session.getTransaction();
		try {
			Criteria criteria = session.createCriteria(Address.class);
			Criterion restriction_eq = Restrictions.eq("user", u);
			criteria.add(restriction_eq);
			return criteria.list();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	//删除指定的收货地址
	public String delAddress(int aid){
		Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
		session.getTransaction();
		try {
			Address c = (Address)session.get(Address.class, aid);
			if(null!=c){
				session.delete(c);
			}
			return "success";
		} catch (Exception e) {
			return "error";
		}
	}
	
	//查找当前登录用户的默认地址,并将其flag设为0
	@SuppressWarnings("unchecked")
	public String updateDefaultAddress(User u){
		Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
		session.getTransaction();
		try {
			Criteria criteria = session.createCriteria(Address.class);
			Criterion restriction_eq = Restrictions.eq("user", u);
			Criterion restriction_eq2 = Restrictions.eq("flag", 1);
			criteria.add(restriction_eq);
			criteria.add(restriction_eq2);
			List<Address> list = criteria.list();
			if(list.size()>0){
				Address a = list.get(0);
				a.setFlag(0);
				session.update(a);
				session.flush();
				return "success";
			}
			return "error";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	
	/**
	 * 
	 * @param u			   当前登录用户
	 * @param aid			   即将要设置为默认地址的id
	 * @param address     当前登录用户原来的默认地址
	 * @return				   设置结果
	 */
	//设置默认地址
	public String setDefaultAddress(int aid){
		Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
		session.getTransaction();
		try {
			Address ads = (Address)session.get(Address.class, aid);
			ads.setFlag(1);
			session.update(ads);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	//根据id查询地址
	public Address getAddressById(Integer aid){
		Address address = getHibernateTemplate().get(Address.class, aid);
		return address;
	}

}
