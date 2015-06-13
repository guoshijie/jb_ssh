package com.jb.dao.Impl;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.jb.dao.IUserDao;
import com.jb.pagination.Page;
import com.jb.pojo.User;

public class IUserDaoImpl extends HibernateDaoSupport implements IUserDao {

	//下单后更新user帐户余额
	public boolean updateUserMoney(Double sumMoney,User user){
		Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
		session.getTransaction();
		try {
			user.setMoney(user.getMoney()-sumMoney);
			session.update(user);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public String addUser(User user) {
		Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
		session.getTransaction();
		try {
			session.save(user);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	//前台更新用户信息
	public String updateUser(User user){
		Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
		session.getTransaction();
		try {
			session.update(user);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	public User searchPwdByName(String uname){
		Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
		session.getTransaction();
		
		//创建QBC查询对象
		Criteria criteria = session.createCriteria(User.class);
		
		Criterion restriction_eq = Restrictions.eq("uname", uname);
		criteria.add(restriction_eq);
		if(criteria.list().size()>0){
			return (User)criteria.list().get(0);
		}else{
			return null;
		}
		
	}
	
	public Boolean hasUser( final String uname){
		
		return getHibernateTemplate().execute(new HibernateCallback<Boolean>() {

			public Boolean doInHibernate(Session session) throws HibernateException,
					SQLException {

				Criteria criteria = session.createCriteria(User.class);
				Criterion restriction_eq = Restrictions.eq("uname", uname);
				criteria.add(restriction_eq);
				System.out.println(criteria.list().size());
				if(criteria.list().size()>0){
					return true;
				}else{
					return false;
				}
			}
		});
	}
	
	public int getUserNum(){
		Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
		session.getTransaction();
		//创建QBC查询对象
		Criteria criteria = session.createCriteria(User.class);
		return criteria.list().size();
	}
	
	public List<User> getPageList(Page page){
		
		Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
		session.getTransaction();
		
		Criteria criteria = session.createCriteria(User.class);
		criteria.setFirstResult(page.getBeginNum());  //设置开始位置
		criteria.setMaxResults(page.getPageSize());  //设置查询数量
		
		@SuppressWarnings("unchecked")
		List<User> users = criteria.list();
		return users;
	}
	
	//后台根据用户名模糊查询用户
	public List<User> searchUserByName(String name){

		Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
		session.getTransaction();
		//模糊查询
		Criteria criteria = session.createCriteria(User.class);
		Criterion restriction_like = Restrictions.like("uname", name , MatchMode.ANYWHERE ); 
		criteria.add(restriction_like);
		
		@SuppressWarnings("unchecked")
		List<User> users = criteria.list();
		return users;
	}
	
	//后台根据id查询用户，即用户的修改功能
	public User searchUserById(int id){
		Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
		session.getTransaction();
		//模糊查询
		Criteria criteria = session.createCriteria(User.class);
		Criterion restriction_eq = Restrictions.eq("uid", id);
		criteria.add(restriction_eq);
		
		@SuppressWarnings("unchecked")
		List<User> users = criteria.list();
		if(users.get(0)!=null){
			return users.get(0);
		}
		return null;
	}
	
	//后台删除用户
	public int delUser(String[] k){
		int flag = 0;
		for(String s:k){
			int id = Integer.parseInt(s);
			User user = (User)getHibernateTemplate().get(User.class, id);
			getHibernateTemplate().delete(user);
			flag++;
		}
		return flag;
	}
	
	//后台修改用户
	public String modifyUser(User user){
		try {
			getHibernateTemplate().update(user);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	//给当前登录用户帐户充值
	public User recharge(User user,Double money){
		Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
		session.getTransaction();
		User userById = searchUserById(user.getUid());
		userById.setMoney(userById.getMoney()+money);
		getHibernateTemplate().saveOrUpdate(userById);
		return userById;
	}
	
}
