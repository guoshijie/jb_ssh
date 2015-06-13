package com.jb.dao.Impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.jb.dao.IGoodsDao;
import com.jb.pagination.Page;
import com.jb.pojo.Category;
import com.jb.pojo.Goods;
import com.jb.pojo.Items;
import com.jb.utils.ArrayUtils;

public class IGoodsDaoImpl extends HibernateDaoSupport implements IGoodsDao {

	//后台销量统计，为饼状图准备数据
	@SuppressWarnings("unchecked")
	public List<Goods> getPieData(){
		Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
		session.getTransaction();
		Criteria c = session.createCriteria(Goods.class ); 
		Criterion ctn = Restrictions.gt("snum", 0);
		c.add(ctn);
		return c.list();
	}
	
	//后台更新商品信息
	public String updateGoods(Goods goods){
		Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
		session.getTransaction();
		//System.out.println(goods);
		try {
			session.update(goods);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	//根据商品的status来查询相应的商品列表
	@SuppressWarnings("unchecked")
	public List<Goods> getAllStorageGoods(Integer status){
		Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
		session.getTransaction();
		Criteria c = session.createCriteria(Goods.class ); 
		Criterion ctn = Restrictions.eq("status", status);
		c.add(ctn);
		return c.list();
	}
	
	//后台根据商品的status查看商品,分页显示
	@SuppressWarnings("unchecked")
	public List<Goods> getStorageGoodsByPage(Page page,Integer status){
		Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
		session.getTransaction();
		Criteria c = session.createCriteria(Goods.class ); 
		Criterion ctn = Restrictions.eq("status", status);
		c.setFirstResult(page.getBeginNum());
		c.setMaxResults(page.getPageSize());
		c.add(ctn);
		return c.list();
	}
	
	//后台批量上架选中商品
	public int putaway(String[] gidArray){
		int flag = 0;
		for(String s:gidArray){
			int id = Integer.parseInt(s);
			Goods g = (Goods)getHibernateTemplate().get(Goods.class, id);
			g.setStatus(1);
			getHibernateTemplate().saveOrUpdate(g);
			flag++;
		}
		return flag;
	}
	
	//后台批量下架选中商品
	public int removeOffGoodsPatch(String[] gidArray){
		int flag = 0;
		for(String s:gidArray){
			int id = Integer.parseInt(s);
			Goods g = (Goods)getHibernateTemplate().get(Goods.class, id);
			g.setStatus(0);
			getHibernateTemplate().saveOrUpdate(g);
			flag++;
		}
		return flag;
	}
	
	//后台商品管理，分页显示商品
	@SuppressWarnings("unchecked")
	public List<Goods> getGoodsByPage(Page page,Category category,String keyword,String orderby){
		Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
		session.getTransaction();
		Criteria c = session.createCriteria(Goods.class ); 
		Criterion ctn = Restrictions.eq("status", 1);
		if(null!=category){
			Criterion ctn1 = Restrictions.eq("category", category);
			c.add(ctn1);
		}
		if(null!=keyword&&keyword!=""){
			Criterion ctn2 = Restrictions.like("gname", keyword,  MatchMode.ANYWHERE);
			c.add(ctn2);
		}
		if(null!=orderby&&orderby!=""){
			c.addOrder(Order.asc(orderby));
		}
		c.setFirstResult(page.getBeginNum());
		c.setMaxResults(page.getPageSize());
		c.add(ctn);
		return c.list();
	}
	
	//查询所有商品
	@SuppressWarnings("unchecked")
	public List<Goods> getAllGoods(){
		Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
		session.getTransaction();
		Criteria c = session.createCriteria(Goods.class ); 
		Criterion ctn = Restrictions.eq("status", 1);
		c.add(ctn);
		return c.list();
	}
	
	//后台按条件查询所有商品
	@SuppressWarnings("unchecked")
	public List<Goods> getAllGoodsByCondition(Category category,String keyword,String orderby){
		Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
		session.getTransaction();
		Criteria c = session.createCriteria(Goods.class ); 
		Criterion ctn = Restrictions.eq("status", 1);
		if(null!=category){
			Criterion ctn1 = Restrictions.eq("category", category);
			c.add(ctn1);
		}
		if(null!=keyword&&keyword!=""){
			Criterion ctn2 = Restrictions.like("gname", keyword,  MatchMode.ANYWHERE);
			c.add(ctn2);
		}
		if(null!=orderby&&orderby!=""){
			c.addOrder(Order.asc(orderby));
		}
		c.add(ctn);
		return c.list();
	}
	
	//查询某三级类型下的所有商品
	@SuppressWarnings("unchecked")
	public List<Goods> queryGoodsListByThreeLevel(List<Category> list,String sort,Map<String,Object> conditions){
		Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
		session.getTransaction();
		Criteria c = session.createCriteria(Goods.class ); 
		Criterion ctn = Restrictions.in("category", list);
		if(null!=conditions&&conditions.size()>0){
			if(null!=conditions.get("sprice")){
				String[] sprice = ((String)conditions.get("sprice")).split(",");	//eg:0,199
				c.add(Restrictions.between("sprice", Double.parseDouble(sprice[0]), Double.parseDouble(sprice[1])));
			}
			if(null!=conditions.get("noPostage")){
				String noPostage = (String)conditions.get("noPostage");
				if(noPostage.equals("包邮")){
					noPostage = "是";
				}else{
					noPostage = "否";
				}
				c.add(Restrictions.eq("noPostage", noPostage));
			}
			if(null!=conditions.get("area")){
				String area = (String)conditions.get("area");
				c.add(Restrictions.eq("area", area));
			}
		}
		if(null!=sort){
			String[] sortt = sort.split(",");	
			if(sortt[1].equals("asc")){
				c.addOrder(Order.asc(sortt[0]));
			}else{
				c.addOrder(Order.desc(sortt[0]));
			}
		}
		c.add(ctn);
		return c.list();
	}
	
	//多条件查询商品
	@SuppressWarnings("unchecked")
	public List<Goods> queryGoodsByConditions(Map<String,Object> conditions,List<Category> categoryList,String sort){
		Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
		session.getTransaction();
		Criteria c = session.createCriteria(Goods.class );  //QBC
		if(null!=conditions&&conditions.size()>0){
			if(null!=conditions.get("sprice")){
				String[] sprice = ((String)conditions.get("sprice")).split(",");	//eg:0,199
				c.add(Restrictions.between("sprice", Double.parseDouble(sprice[0]), Double.parseDouble(sprice[1])));
			}
			if(null!=categoryList&&categoryList.size()>0){
				c.add(Restrictions.in("category", categoryList));
			}
			if(null!=conditions.get("noPostage")){
				String noPostage = (String)conditions.get("noPostage");
				if(noPostage.equals("包邮")){
					noPostage = "是";
				}else{
					noPostage = "否";
				}
				c.add(Restrictions.eq("noPostage", noPostage));
			}
			if(null!=conditions.get("area")){
				String area = (String)conditions.get("area");
				c.add(Restrictions.eq("area", area));
			}
		}
		if(null!=sort){
			String[] sortt = sort.split(",");	
			if(sortt[1].equals("asc")){
				c.addOrder(Order.asc(sortt[0]));
			}else{
				c.addOrder(Order.desc(sortt[0]));
			}
		}
		return c.list();
	}
	
	//查询商品表，按销量排序,即首页的热门推荐
	public List<Goods> getGoodsListOrderBySnum(){
		List<Goods> list = getGoodsListOrderBy$("snum", "desc");
		return list;
	}
	
	//查询商品表，按发布时间排序
	public List<Goods> getGoodsListOrderByPubTime(){
		List<Goods> list = getGoodsListOrderBy$("modifyTime", "desc");
		return list;
	}
	
	//共通方法
	@SuppressWarnings("unchecked")
	public List<Goods> getGoodsListOrderBy$(String attr,String order){
		Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
		session.getTransaction();
		try {
			Criteria criteria = session.createCriteria(Goods.class);
			if(order.equals("desc")){
				criteria.addOrder(org.hibernate.criterion.Order.desc(attr));
			}else{
				criteria.addOrder(org.hibernate.criterion.Order.asc(attr));
			}
			criteria.setFirstResult(0);
			criteria.setMaxResults(5);
			return criteria.list();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	//按三级类型查询
	@SuppressWarnings("unchecked")
	public List<Goods> getGoodsListByThreeLevel(List<Category> category){
		Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
		session.getTransaction();
		Criteria criteria = session.createCriteria(Goods.class);
		Criterion ctn = Restrictions.in("category", category);
		criteria.add(ctn);
		criteria.addOrder(org.hibernate.criterion.Order.desc("snum"));
		criteria.setFirstResult(0);
		criteria.setMaxResults(5);
		return criteria.list();
	}
	
	//更新商品表里的库存及销量
	public void updateGoodsNums(Set<Items> set){
		Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
		session.getTransaction();
		for(Items item:set){
			Goods goods = getGoodsById(item.getGoods().getGid());
			goods.setSnum(goods.getSnum()+item.getNum());
			goods.setGnum(goods.getGnum()-item.getNum());
			getHibernateTemplate().saveOrUpdate(goods);
		}
	}
	
	//填加商品
	public String addGoods(Goods goods){
		Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
		session.getTransaction();
		try {
			session.save(goods);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	//查询8个商品,用于显示在主页里面的商品显示区域，返回一个List<Goods>
	public List<Goods> getGoods(){
		Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
		Query pageQuery = session.createQuery("from Goods");
		pageQuery.setFirstResult(0); // 从哪里开始
		pageQuery.setMaxResults(8);  // 查询多少条 .
		@SuppressWarnings("unchecked")
		List<Goods> list = pageQuery.list();
		return list;
	}
	
	//随机查询两个商品，用于显示在主页里的直通车区域，返回List<Goods>
	public List<Goods> getZhiTongChe(){
		Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
		Query pageQuery = session.createQuery("from Goods");
		@SuppressWarnings("unchecked")
		List<Goods> list = pageQuery.list();
		int[] randomArray = ArrayUtils.getRandomArray(list.size());
		List<Goods> two = new ArrayList<Goods>();
		for(int i:randomArray){
			two.add(list.get(i-1));
		}
		return two;
	}
	
	//根据id查询某一商品的详细信息
	public Goods getGoodsById(int gid){
		Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
		Goods goods = (Goods)session.get(Goods.class, gid);
		return goods;
	}
	
}
