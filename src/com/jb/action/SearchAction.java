package com.jb.action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.struts2.interceptor.ApplicationAware;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

import com.jb.buz.ICategoryBuz;
import com.jb.pojo.Category;
import com.opensymphony.xwork2.Action;

public class SearchAction implements Action,ServletRequestAware,ServletResponseAware,ApplicationAware{

	@SuppressWarnings("unused")
	private HttpServletRequest request;
	private HttpServletResponse response;
	@SuppressWarnings("unused")
	private ICategoryBuz iCategoryBuz;
	private Map<String,Object> application;
	
	@SuppressWarnings("unchecked")
	@Override
	public String execute() throws Exception {
		response.reset();
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		//List<Category> listByLevel = iCategoryBuz.getCategoryListByLevel(3);
		List<Category> listByLevel=(List<Category>)application.get("indexSearchListByLevel");
		List<String> strlist = new ArrayList<String>();
		for(int i=0;i<listByLevel.size();i++){
			strlist.add(listByLevel.get(i).getName());
		}
		JSONArray jsonArray = JSONArray.fromObject(strlist);
		out.print(jsonArray.toString());
		out.flush();
		out.close();
		return null;
	}
	
	//后台商品搜索
	public String searchGoodsByAdmin(){
		return SUCCESS;
	}
	

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		this.request = arg0;
	}

	public void setiCategoryBuz(ICategoryBuz iCategoryBuz) {
		this.iCategoryBuz = iCategoryBuz;
	}

	@Override
	public void setServletResponse(HttpServletResponse arg0) {
		this.response = arg0;
	}

	@Override
	public void setApplication(Map<String, Object> arg0) {
		this.application=arg0;
	}


}
