package com.jb.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;

import com.jb.buz.ICollectBuz;
import com.jb.buz.IUserBuz;
import com.jb.pagination.Page;
import com.jb.pagination.PageUtils;
import com.jb.pojo.Collect;
import com.jb.pojo.Goods;
import com.jb.pojo.User;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;

public class CollectAction implements Action,ServletRequestAware,ServletResponseAware,SessionAware {

	private User user;
	private Goods goods;
	private ICollectBuz iCollectBuz;
	private IUserBuz iUserBuz;
	HttpServletRequest request;
	private Map<String, Object> session;
	HttpServletResponse response;
	private Page page;
	private PageUtils pageUtils;
	private int pageSize = 4;
	
	//后台删除订单关键字
	public String delCollectKeywords(){
		session.remove("collectManage_keywords");
		return SUCCESS;
	}
	
	//后台查询所有收藏
	public String adminGetAllCollectByPage(){
		List<User> u_list = new ArrayList<User>();
		List<Collect> allCollectList = new ArrayList<Collect>();
		String uname = request.getParameter("collect_keywords");
		String condition = request.getParameter("condition");
		if(null!=uname){
			session.put("collectManage_keywords", uname);
		}
		u_list = iUserBuz.searchUserByName((String)session.get("collectManage_keywords"));
		if(null!=u_list&&u_list.size()>0){
			allCollectList = iCollectBuz.obtainAllCollectByUserCollection(u_list, null);
		}else if(null!=condition&&condition.equals("allOrder")){
			allCollectList = iCollectBuz.obtainAllCollectByUserCollection(null, null);
			session.remove("collectManage_keywords");
		}else if(null==condition&&u_list.size()==0){
			allCollectList = iCollectBuz.obtainAllCollectByUserCollection(u_list, null);
		}
		
		if(null!=allCollectList&&allCollectList.size()>0){
			List<Collect> collectListByPage = new ArrayList<Collect>();
			int pageNow = 1;
			String pn = request.getParameter("pageNow");
			if(null!=pn){
				pageNow = Integer.parseInt(pn);
			}
			page = pageUtils.createPage(allCollectList.size(), 5, pageNow);
			collectListByPage = iCollectBuz.obtainAllCollectByUserCollection(u_list, page);
			page.setList(collectListByPage);
			session.put("collectManageByAdmin", page);
			return SUCCESS;
		}else{
			session.remove("collectManageByAdmin");
			return SUCCESS;
		}
		
	}
	
	@Override
	//收藏一个商品
	public String execute() throws Exception {
		int gid = Integer.parseInt(request.getParameter("gid"));
		goods.setGid(gid);
		
		User u = (User)request.getSession().getAttribute("jbuser");
		user.setUid(u.getUid());
		
		iCollectBuz.addCollect(user, goods);
		request.setAttribute("gid", u.getUid());
		return SUCCESS;
	}
	
	//分页取得当前登录用户收藏过的商品List
	public String getCollectListByPage(){
		User u = (User)request.getSession().getAttribute("jbuser");
		List<Goods> list = iCollectBuz.getCollectList(u);
		String pn = request.getParameter("pageNow");
		int pageNow = Integer.parseInt(pn);
		page = pageUtils.createPage(list.size(), pageSize, pageNow);
		
		List<Goods> listByPage = iCollectBuz.getCollectListByPage(page, u);
		ActionContext.getContext().put("listByPage", listByPage);
		ActionContext.getContext().put("page", page);
		
		return SUCCESS;
	}
	
	//取消收藏某一商品
	public String deleteOneCollect(){
		User u = (User)request.getSession().getAttribute("jbuser");
		List<Goods> list = iCollectBuz.getCollectList(u);
		String pn = request.getParameter("pageNow");
		int pageNow = Integer.parseInt(pn);
		page = pageUtils.createPage(list.size(), pageSize, pageNow);
		
		String id=request.getParameter("cid");
		int cid = Integer.parseInt(id);
		
		return iCollectBuz.deleteOneCollect(cid);
	}
	
	//批量删除所收藏的商品
	public String deleteCollects(){
		User u = (User)request.getSession().getAttribute("jbuser");
		List<Goods> list = iCollectBuz.getCollectList(u);
		String pn = request.getParameter("pageNow");
		int pageNow = Integer.parseInt(pn);
		page = pageUtils.createPage(list.size(), pageSize, pageNow);
		
		String[] str = request.getParameterValues("selGoods");
		boolean b = iCollectBuz.deleteCollects(str);
		return b==true?SUCCESS:ERROR;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}

	public Goods getGoods() {
		return goods;
	}
	
	public void setiCollectBuz(ICollectBuz iCollectBuz) {
		this.iCollectBuz = iCollectBuz;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	@Override
	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
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

	@Override
	public void setSession(Map<String, Object> arg0) {
		this.session = arg0;
	}

	public void setiUserBuz(IUserBuz iUserBuz) {
		this.iUserBuz = iUserBuz;
	}

}
