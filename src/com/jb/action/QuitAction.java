package com.jb.action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.jb.buz.ICartBuz;
import com.jb.pojo.Items;
import com.jb.pojo.User;
import com.opensymphony.xwork2.ActionSupport;

public class QuitAction extends ActionSupport implements SessionAware,ServletRequestAware {

	private static final long serialVersionUID = 6810144065467961558L;
	private ICartBuz iCartBuz;
	private HttpServletRequest request;

	Map<String,Object> session;
	@SuppressWarnings({ "unchecked" })
	public String quit() throws Exception{
		
		Map<Integer,Items> oldCart =  (Map<Integer,Items>)session.get("jb_cart");
		User u = (User)request.getSession().getAttribute("jbuser");
		Double sumprice = (Double)request.getSession().getAttribute("sumPrice");
		if(null!=oldCart&&oldCart.size()>0){
			iCartBuz.addItemsToCart(oldCart, u, sumprice);
		}else{
			iCartBuz.delCartByUser(u);
		}
		session.remove("jbname");
		session.remove("jb_cart");
		session.remove("userOrders");
		session.remove("orderPage");
		session.remove("numNoDiscussItems");
		return SUCCESS;
	}
	
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public void setiCartBuz(ICartBuz iCartBuz) {
		this.iCartBuz = iCartBuz;
	}

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		this.request = arg0;
	}

}
