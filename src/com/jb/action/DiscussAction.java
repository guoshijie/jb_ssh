package com.jb.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.jb.buz.IDiscussBuz;
import com.jb.buz.IGoodsBuz;
import com.jb.buz.IItemsBuz;
import com.jb.pagination.Page;
import com.jb.pagination.PageUtils;
import com.jb.pojo.Discuss;
import com.jb.pojo.Goods;
import com.jb.pojo.Items;
import com.jb.pojo.User;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;

public class DiscussAction implements Action,ModelDriven<Discuss>,ServletRequestAware,SessionAware{

	private IDiscussBuz	iDiscussBuz;
	private IItemsBuz iItemsBuz;
	private HttpServletRequest request;
	private Map<String, Object> session;
	private Discuss discuss;
	private IGoodsBuz iGoodsBuz;
	private PageUtils pageUtils;
	private Page page;
	private int pageSize = 4;
	
	//查询将要评价的item
	public String searchItemDiscuss(){
		String string = request.getParameter("itemId");
		Integer id = Integer.parseInt(string);
		Items item = iItemsBuz.obtainItemsById(id);
		session.put("discussItem", item);
		return SUCCESS;
	}
	
	//评价商品
	public String discussGoods(){
		Integer itemId = Integer.parseInt(request.getParameter("itemId"));
		Items itemsById = iItemsBuz.obtainItemsById(itemId);
		User u = (User)request.getSession().getAttribute("jbuser");
		discuss.setItems(itemsById);
		discuss.setUser(u);
		discuss.setGoods(itemsById.getGoods());
		iDiscussBuz.addDiscuss(discuss);
		return SUCCESS;
	}
	
	//分页显示商品评论
	public String discussByPage(){
		String parameter = request.getParameter("discussCondition");
		Integer discussCondition = 0;
		if(null!=parameter){
			discussCondition = Integer.parseInt(parameter);
		}
		
		int gid = Integer.parseInt(request.getParameter("gid"));
		Goods g = iGoodsBuz.getGoodsById(gid);
	
		List<Discuss> allDiscussByGoods = iDiscussBuz.getAllDiscussByGoods(g,discussCondition);
		if(null!=allDiscussByGoods&&allDiscussByGoods.size()>0){
			int pageNow =1;
			String pn = request.getParameter("pageNow");
			if(null!=pn){
				pageNow = Integer.parseInt(pn);
			}
			page = pageUtils.createPage(allDiscussByGoods.size(), pageSize, pageNow);
			List<Discuss> discussByPage = iDiscussBuz.getDiscussByPage(g, page,discussCondition);
			session.put("goodsDetailsDiscussByPage", discussByPage);
			session.put("goodsDetailsPage", page);
			return SUCCESS;
		}
		return ERROR;
	}
	
	@Override
	public String execute() throws Exception {
		return null;
	}

	public void setiDiscussBuz(IDiscussBuz iDiscussBuz) {
		this.iDiscussBuz = iDiscussBuz;
	}

	@Override
	public void setSession(Map<String, Object> arg0) {
		this.session = arg0;
	}

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		this.request = arg0;
	}


	public void setiItemsBuz(IItemsBuz iItemsBuz) {
		this.iItemsBuz = iItemsBuz;
	}

	@Override
	public Discuss getModel() {
		return this.discuss;
	}

	public Discuss getDiscuss() {
		return discuss;
	}

	public void setDiscuss(Discuss discuss) {
		this.discuss = discuss;
	}

	public void setiGoodsBuz(IGoodsBuz iGoodsBuz) {
		this.iGoodsBuz = iGoodsBuz;
	}

	public void setPageUtils(PageUtils pageUtils) {
		this.pageUtils = pageUtils;
	}

	public void setPage(Page page) {
		this.page = page;
	}

}
