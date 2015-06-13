package com.jb.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.jb.buz.ICategoryBuz;
import com.jb.pojo.Category;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class CategoryAction extends ActionSupport implements ModelDriven<Category>,ServletRequestAware{
	
	private static final long serialVersionUID = 2235657981565088353L;

	HttpServletRequest request;
	private Category category;
	private ICategoryBuz iCategoryBuz;
	private String meg;
	
	//获取所有商品类别
	public String getType() throws Exception {
		List<Category> list = iCategoryBuz.getTypeInfo();
		ActionContext.getContext().put("type", list);
		return SUCCESS;
	}
	
	public String getTypeById() throws Exception{
		String str = ((String[])ActionContext.getContext().getParameters().get("id"))[0];
		if(!"".equals(str)){
			int id = Integer.parseInt(str);
			List<Category> childInfo = iCategoryBuz.getTypeById(id);
			JSONArray array = JSONArray.fromObject(childInfo.toString());
			ServletActionContext.getResponse().getWriter().print(array);
		}
		return SUCCESS;
	}
	
	//获取一级类别
	public Map<Integer,String> getAllRootCategory(){
		List<Category> childInfo = iCategoryBuz.getAllRootCategory();
		Map<Integer,String> childMap = new HashMap<Integer,String>();
		for(Category c:childInfo){
			childMap.put(c.getId(), c.getName());
		}
		return childMap;
	}
	
	//根据id获取子类别
	public Map<Integer,String> getChildCategoryById(int id){
		List<Category> childInfo = iCategoryBuz.getTypeById(id);
		Map<Integer,String> childMap = new HashMap<Integer,String>();
		for(Category c:childInfo){
			childMap.put(c.getId(), c.getName());
		}
		return childMap;
	}
	
	//添加商品类型
	public String addType() throws Exception {
		String info = ((String[])ActionContext.getContext().getParameters().get("info"))[0];
		String info2 = ((String[])ActionContext.getContext().getParameters().get("info2"))[0];
		if(!"".equals(info2)&&null!=info2){
			int id = Integer.parseInt(info2);
			iCategoryBuz.addType(category,id);
		}else if(!"".equals(info)){
			int id = Integer.parseInt(info);
			iCategoryBuz.addType(category,id);
		}else{
			meg = iCategoryBuz.addType(category);
			request.setAttribute("meg", meg);
		}
		return SUCCESS;
	}

	public void setiCategoryBuz(ICategoryBuz iCategoryBuz) {
		this.iCategoryBuz = iCategoryBuz;
	}
	
	public void setCategory(Category category) {
		this.category = category;
	}
	public Category getModel() {
		return category;
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	public String getMeg() {
		return meg;
	}

	public void setMeg(String meg) {
		this.meg = meg;
	}

}
