package com.jb.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.jb.buz.IAddressBuz;
import com.jb.pojo.Address;
import com.jb.pojo.User;
import com.jb.properties.Message;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;

public class AddressAction implements Action,ModelDriven<Address>,ServletRequestAware{

	private Address address;
	HttpServletRequest request;
	private IAddressBuz iAddressBuz;
	private String meg_address;
	
	//添加收货地址
	public String addAddress(){
		User u = (User)request.getSession().getAttribute("jbuser");
		iAddressBuz.addAddress(address, u);
		setMeg_address("成功添加新地址");
		request.setAttribute("meg_address", meg_address);
		return SUCCESS;
	}
	
	//获得当前登录用户的所有地址信息
	public String getAllAddress(){
		String meg = request.getParameter("meg");
		if(null!=meg){
			request.setAttribute("meg", meg);
		}
		User u = (User)request.getSession().getAttribute("jbuser");
		List<Address> list = iAddressBuz.getAddress(u);
		ActionContext.getContext().put("list_address", list);
		
		//meg_address = request.getParameter("meg_address");
		ActionContext.getContext().put("addressAddInfo", meg_address);
		return SUCCESS;
	}
	
	//删除指定的收货地址
	public String delAddress(){
		int aid = Integer.parseInt(request.getParameter("aid"));
		String meg_address = iAddressBuz.delAddress(aid);
		if(meg_address.equals("success")){
			return SUCCESS;
		}else{
			request.setAttribute("meg", Message.ADDRESS_DEL_ERROR);
			return ERROR;
		}
	}
	
	//设置默认收货地址
	public String setDefaultAddress(){
		User u = (User)request.getSession().getAttribute("jbuser");
		int aid = Integer.parseInt(request.getParameter("aid"));
		return iAddressBuz.updateDefaultAddress(aid, u);
	}
	
	@Override
	public Address getModel() {
		return address;
	}
	
	@Override
	public String execute() throws Exception {
		return null;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	public IAddressBuz getiAddressBuz() {
		return iAddressBuz;
	}

	public void setiAddressBuz(IAddressBuz iAddressBuz) {
		this.iAddressBuz = iAddressBuz;
	}

	public String getMeg_address() {
		return meg_address;
	}

	public void setMeg_address(String meg_address) {
		this.meg_address = meg_address;
	}

}
