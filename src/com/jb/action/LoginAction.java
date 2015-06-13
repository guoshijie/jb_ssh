package com.jb.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.jb.buz.ICartBuz;
import com.jb.buz.IItemsBuz;
import com.jb.buz.IOrderBuz;
import com.jb.buz.IUserBuz;
import com.jb.pojo.Cart;
import com.jb.pojo.Items;
import com.jb.pojo.Order;
import com.jb.pojo.User;
import com.jb.properties.Message;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class LoginAction extends ActionSupport implements ModelDriven<User>,SessionAware,RequestAware {

	private static final long serialVersionUID = -8760210817967754084L;
	private ICartBuz iCartBuz;
	private IItemsBuz iItemsBuz;
	private IOrderBuz iOrderBuz;

	ActionContext context = ActionContext.getContext();
	private User user;
	Map<String,Object> session;
	Map<String,Object> request;
	IUserBuz iUserBuz;
	
	public User getModel() {
		return this.user;
	}
	
	public String login() throws Exception{
		String res = iUserBuz.login(user);
		if(res.equals("success")){
			session.put("jbname", user.getUname());
			List<User> list = iUserBuz.searchUserByName(user.getUname());
			User u = list.get(0);
			session.put("jbuser", u);
			session.put("money", u.getMoney());
			
			//用户登录后，初始化登录用户的购物车map
			Cart cart = iCartBuz.getCartByUser(u);
			if(null!=cart){
				List<Items> itemsByCart = iItemsBuz.getItemsByCart(cart);
				Map<Integer, Items> oldCart = iCartBuz.initCartMap(itemsByCart);
				session.put("jb_cart", oldCart);
				putGoodsCountAndSumPriceToSession(oldCart);
			}
			
			//初始化当前登录用户的未评价商品数量
			List<Order> list_Order = iOrderBuz.obtainAllOrdersByUser(u,1);
			Integer numNoDiscussItems = iOrderBuz.calculateTheNumNoDiscussItems(list_Order);
			session.put("numNoDiscussItems", numNoDiscussItems);
			return SUCCESS;
		}else{
			request.put("login", "用户名或密码错误");
			return ERROR;
		}
	}
	
	public void putGoodsCountAndSumPriceToSession(Map<Integer, Items> newCart){
		Double sumPrice = iCartBuz.getCartSumPrice(newCart);
		session.put("sumPrice", sumPrice);
		Integer sumCount = iCartBuz.getCartGoodsSumCount(newCart);
		session.put("sumCount", sumCount);
	}
	
	public String adminLogin() throws Exception{
		String res = iUserBuz.login(user);
		User u = iUserBuz.searchPwdByName(user.getUname());
		if(res.equals("success")){
			session.put("jbname", user.getUname());
			session.put("jbuser", u);
			session.put("money", u.getMoney());
			return SUCCESS;
		}else{
			request.put("login", Message.ADMIN_LOGIN_ERROR);
			return ERROR;
		}
	}
	
	public void setUser(User user) {
		this.user = user;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}

	public void setiUserBuz(IUserBuz iUserBuz) {
		this.iUserBuz = iUserBuz;
	}

	public void setiCartBuz(ICartBuz iCartBuz) {
		this.iCartBuz = iCartBuz;
	}

	public void setiItemsBuz(IItemsBuz iItemsBuz) {
		this.iItemsBuz = iItemsBuz;
	}

	public void setiOrderBuz(IOrderBuz iOrderBuz) {
		this.iOrderBuz = iOrderBuz;
	}

	
}
