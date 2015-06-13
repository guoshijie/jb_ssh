package com.jb.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.jb.buz.ICartBuz;
import com.jb.buz.IOrderBuz;
import com.jb.buz.IUserBuz;
import com.jb.pagination.Page;
import com.jb.pagination.PageUtils;
import com.jb.pojo.Items;
import com.jb.pojo.Order;
import com.jb.pojo.User;
import com.opensymphony.xwork2.Action;

public class OrderAction implements Action,SessionAware,ServletRequestAware {

	private Map<String, Object> session;
	private IOrderBuz iOrderBuz;
	private IUserBuz iUserBuz;
	private ICartBuz iCartBuz;
	private HttpServletRequest request;
	private Page page;
	private PageUtils pageUtils;
	private int pageSize = 2;
	
	//前台定单回收站彻底删除订单，即将定单的status设为2
	public String delRelOrders(){
		String[] oid_array = request.getParameterValues("oid");
		boolean b = iOrderBuz.putawayOrders(oid_array,2);
		if(b){
			return SUCCESS;
		}
		return ERROR;
	}
	
	//前台订单回收站恢复订单，即将定单的status设为1
	public String putawayOrders(){
		String oid = request.getParameter("oid");
		boolean b = iOrderBuz.putawayOrders(oid,1);
		if(b){
			return SUCCESS;
		}
		return ERROR;
	}
	
	//前台定单回收站
	public String ordersRecycle(){
		User u = (User)request.getSession().getAttribute("jbuser");
		List<Order> list = iOrderBuz.obtainAllOrdersByUser(u,0);
		if(null!=list&&list.size()>0){
			int pageNow = 1;
			String pn = request.getParameter("pageNow");
			if(null!=pn){
				pageNow = Integer.parseInt(pn);
			}
			page = pageUtils.createPage(list.size(), pageSize, pageNow);
			
			List<Order> orderListByPage = iOrderBuz.obtainOrderListByPage(page, u,0);
			Integer numNoDiscussItems = iOrderBuz.calculateTheNumNoDiscussItems(list);
			session.put("userOrdersRecycle", orderListByPage);
			session.put("orderPageRecycle", page);
			session.put("numNoDiscussItems", numNoDiscussItems);
			return SUCCESS;
		}else{
			session.remove("orderPageRecycle");
			session.remove("userOrdersRecycle");
			session.remove("numNoDiscussItems");
			return ERROR;
		}
	}
	
	//批量删除选中定单
	public String delOrdersPatch(){
		String[] oidArray = request.getParameterValues("id");
		Boolean b = iOrderBuz.delOrdersPatch(oidArray);
		if(b){
			return SUCCESS;
		}
		return ERROR;
	}
	
	//后台删除订单关键字
	public String delOrderKeywords(){
		session.remove("orderManage_keywords");
		return SUCCESS;
	}
	
	//后台订单管理
	public String orderManageByAdmin(){
		List<User> u_list = new ArrayList<User>();
		List<Order> allOrderList = new ArrayList<Order>();
		String uname = request.getParameter("order_keywords");
		String condition = request.getParameter("condition");
		if(null!=uname){
			session.put("orderManage_keywords", uname);
		}
		u_list = iUserBuz.searchUserByName((String)session.get("orderManage_keywords"));
		if(null!=u_list&&u_list.size()>0){
			allOrderList = iOrderBuz.obtainAllOrderByUsersCollection(u_list,1);
		}else if(null!=condition&&condition.equals("allOrder")){
			allOrderList = iOrderBuz.obtainAllOrdersByUser(null,1);
			session.remove("orderManage_keywords");
		}else if(null==condition&&u_list.size()==0){
			allOrderList = iOrderBuz.obtainAllOrderByUsersCollection(u_list,1);
		}
		
		if(null!=allOrderList&&allOrderList.size()>0){
			List<Order> orderListByPage = new ArrayList<Order>();
			int pageNow = 1;
			String pn = request.getParameter("pageNow");
			if(null!=pn){
				pageNow = Integer.parseInt(pn);
			}
			page = pageUtils.createPage(allOrderList.size(), 3, pageNow);
			orderListByPage = iOrderBuz.getAllOrdersByPage(page, u_list,1);
			page.setList(orderListByPage);
			session.put("orderManageByAdmin", page);
			return SUCCESS;
		}else{
			session.remove("orderManageByAdmin");
			return SUCCESS;
		}
	}
	
	//下单
	@SuppressWarnings("unchecked")
	public String placeAnOrder(){
		Map<Integer,Items> newCart =  (Map<Integer,Items>)session.get("jb_newCart");
		Map<Integer,Items> oldCart =  (Map<Integer,Items>)session.get("jb_cart");
		User u = (User)request.getSession().getAttribute("jbuser");
		Double sumprice = (Double)request.getSession().getAttribute("sumPrice");
		Double sumprice2 = (Double)request.getSession().getAttribute("sumPrice2");
		Integer aid = Integer.parseInt(request.getParameter("address_order"));
		boolean b = iOrderBuz.addOrder(aid, newCart,u,sumprice2);
		if(b){
			if(null!=oldCart&&oldCart.size()>0){
				iCartBuz.addItemsToCart(oldCart, u, sumprice);
			}
			//更新帐户余额
			User user = iUserBuz.searchUserById(u.getUid());
			session.put("money", user.getMoney());
			return SUCCESS;
		}else{
			return ERROR;
		}
	}
	
	//查询当前登录用户的所有订单,分页显示
	public String obtainAllOrdersByUser(){
		User u = (User)request.getSession().getAttribute("jbuser");
		List<Order> list = iOrderBuz.obtainAllOrdersByUser(u,1);
		if(null!=list&&list.size()>0){
			int pageNow = 1;
			String pn = request.getParameter("pageNow");
			if(null!=pn){
				pageNow = Integer.parseInt(pn);
			}
			page = pageUtils.createPage(list.size(), pageSize, pageNow);
			
			List<Order> orderListByPage = iOrderBuz.obtainOrderListByPage(page, u,1);
			Integer numNoDiscussItems = iOrderBuz.calculateTheNumNoDiscussItems(list);
			session.put("userOrders", orderListByPage);
			session.put("orderPage", page);
			session.put("numNoDiscussItems", numNoDiscussItems);
			return SUCCESS;
		}
		return ERROR;
	}
	
	@Override
	public void setSession(Map<String, Object> arg0) {
		this.session = arg0;
	}

	@Override
	public String execute() throws Exception {
		return null;
	}

	public void setiOrderBuz(IOrderBuz iOrderBuz) {
		this.iOrderBuz = iOrderBuz;
	}

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		this.request = arg0;
	}

	public void setiCartBuz(ICartBuz iCartBuz) {
		this.iCartBuz = iCartBuz;
	}

	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}

	public PageUtils getPageUtils() {
		return pageUtils;
	}

	public void setPageUtils(PageUtils pageUtils) {
		this.pageUtils = pageUtils;
	}

	public void setiUserBuz(IUserBuz iUserBuz) {
		this.iUserBuz = iUserBuz;
	}
	
}
