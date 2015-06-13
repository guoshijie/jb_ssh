package com.jb.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.jb.buz.INewsBuz;
import com.jb.pagination.Page;
import com.jb.pagination.PageUtils;
import com.jb.pojo.News;
import com.jb.pojo.User;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;

public class NewsAction implements Action,ModelDriven<News>,ServletRequestAware,SessionAware{

	private HttpServletRequest request;
	private Map<String,Object> session;
	private INewsBuz iNewsBuz;
	private News news;
	private PageUtils pageUtils;
	private Page page;
	private int pageSize = 8;
	
	public String addNews(){
		User u = (User)session.get("jbuser");
		iNewsBuz.addNews(news,u);
		request.setAttribute("meg", "添加成功！");
		return SUCCESS;
	}
	
	//后台批量删除通告
	public String delNewsPatch(){
		String[] nid = request.getParameterValues("id");
		boolean b = iNewsBuz.delNewsPatch(nid);
		if(b){
			return SUCCESS;
		}else{
			request.setAttribute("meg", "删除失败");
			return SUCCESS;
		}
	}
	
	//后台通告管理，分页显示
	public String newsManage(){
		List<News> allNews = iNewsBuz.getAllNews();
		
		if(null!=allNews&&allNews.size()>0){
			int pageNow =1;
			String pn = request.getParameter("pageNow");
			if(null!=pn){
				pageNow = Integer.parseInt(pn);
			}
			page = pageUtils.createPage(allNews.size(), pageSize, pageNow);
			List<News> newsByPage = iNewsBuz.getNewsByPage(page);
			session.put("newsListByPage", newsByPage);
			session.put("newsPage", page);
			return SUCCESS;
		}
		
		
		
		session.put("allNews", allNews);
		return SUCCESS;
	}
	
	//后台删除某一通告
	public String delNews(){
		String s = request.getParameter("id");
		Integer id = Integer.parseInt(s);
		iNewsBuz.delNews(id);
		return SUCCESS;
	}
	
	//后台更新通告
	public String updateNews(){
		User u = (User)session.get("jbuser");
		iNewsBuz.updateNews(news,u);
		request.setAttribute("meg", "修改成功");
		return SUCCESS;
	}
	
	//后台查询某一通告的详细信息
	public String queryNewsById(){
		String s = request.getParameter("id");
		Integer id = Integer.parseInt(s);
		News newsById = iNewsBuz.getNewsById(id);
		request.setAttribute("newsById", newsById);
		return SUCCESS;
	}
	
	@Override
	public String execute() throws Exception {
		return null;
	}

	public void setiNewsBuz(INewsBuz iNewsBuz) {
		this.iNewsBuz = iNewsBuz;
	}

	public News getNews() {
		return news;
	}

	public void setNews(News news) {
		this.news = news;
	}

	@Override
	public News getModel() {
		return this.news;
	}

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		this.request = arg0;
	}

	@Override
	public void setSession(Map<String, Object> arg0) {
		this.session = arg0;
	}

	public void setPageUtils(PageUtils pageUtils) {
		this.pageUtils = pageUtils;
	}

	public void setPage(Page page) {
		this.page = page;
	}

}
