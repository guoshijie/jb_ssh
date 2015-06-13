package com.jb.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.jb.buz.ICategoryBuz;
import com.jb.buz.IConditionBuz;
import com.jb.buz.IGoodsBuz;
import com.jb.pagination.Page;
import com.jb.pagination.PageUtils;
import com.jb.pojo.Category;
import com.jb.pojo.Goods;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;

public class ConditionAction implements Action,SessionAware,ServletRequestAware {

	private Map<String,Object> session;
	private HttpServletRequest request;
	@SuppressWarnings("unused")
	private Goods goods;
	private IGoodsBuz iGoodsBuz;
	private IConditionBuz iConditionBuz;
	private ActionContext context = ActionContext.getContext();
	private ICategoryBuz iCategoryBuz;
	private PageUtils pageUtils;
	private Page page;
	private int pageSize = 12;
	
	@SuppressWarnings("unchecked")
	public String addConditions(){
		// conditions 是用来 存放条件的 
		Map<String,Object> conditions = session.get("conditions")==null?new HashMap<String,Object>():(Map<String,Object>)session.get("conditions");
		// 当前的请求条件
		Map<String,Object> params = context.getParameters();
		
		if(null!=params&&params.size()>0){
			Set<String> keys = params.keySet();
			for(String k:keys){
				//System.out.println("key:"+k+"\tvalues:"+((String[])params.get(k))[0]);
				if(k.equals("categorytwolevel")){
					session.remove("search_text");
				}
				conditions.put(k, ((String[])params.get(k))[0]);
			}
		}
		session.put("conditions", conditions);
		return showGoodsByConditions();
	}
	
	//显示多条件查询后的结果，并分页显示
	@SuppressWarnings("unchecked")
	public String showGoodsByConditions(){
		List<Goods> multiConditionGoodsList = new ArrayList<Goods>();
		List<Goods> queryGoodsByConditions = new ArrayList<Goods>();
		//从 HttpSession 中获取 conditions 约束条件库 <Map>
		String s = request.getParameter("sort");
		if(null!=s){
			session.put("sort", s);
		}
		String sort = (String)session.get("sort");
		String str = request.getParameter("search_text");
		if(null!=str){
			session.put("search_text", str);
		}
		Map<String,Object> conditions = (Map<String,Object>)session.get("conditions");
		
		String res = (String)session.get("search_text");
		//所有商品 list
		if(null!=res){
			List<Category> fuzzyMatchingCname = iCategoryBuz.getCategoryListFuzzyMatchingCname(res);
			queryGoodsByConditions = iGoodsBuz.queryGoodsListByThreeLevel(fuzzyMatchingCname,sort,conditions);
		}else{
			queryGoodsByConditions = iGoodsBuz.queryGoodsByConditions(conditions,sort);
		}
		
		if(null!=queryGoodsByConditions&&queryGoodsByConditions.size()>0){
			int pageNow =1;
			String pn = request.getParameter("pageNow");
			if(null!=pn){
				pageNow = Integer.parseInt(pn);
			}
			page = pageUtils.createPage(queryGoodsByConditions.size(), pageSize, pageNow);
			multiConditionGoodsList = iConditionBuz.getPageMultiConditionGoodsList(page, queryGoodsByConditions);
			session.put("queryGoodsByConditions", multiConditionGoodsList);
			session.put("multiConditionGoodsPage", page);
		}else{
			session.remove("queryGoodsByConditions");
		}
		List<Category> categoryListByLevel = iCategoryBuz.getCategoryListByLevel(2);
		session.put("categoryListByLevel", categoryListByLevel);
		return SUCCESS;
	}
	
	//将条件库中的条件进行删除操作
	@SuppressWarnings("unchecked")
	public String delConditions(){
		//获得条件库
	    Map<String , Object> conditions  = session.get("conditions") == null ? new HashMap<String , Object>() : (Map<String,Object>)session.get("conditions");
		//获得请求参数
		Map<String, Object> params = context.getParameters(); // rent , space 
		if(null!=params && params.size() > 0 ) {
			Set<String> keys = params.keySet();
			for (String k : keys) {
				//System.out.println("删除了条件  : "+((String[])params.get(k))[0] );
				conditions.remove(((String[])params.get(k))[0]);    //条件库中 有   rent , space , network , :   而传入的是 space
			}
		}
		session.put("conditions", conditions);
		return showGoodsByConditions();
	}
	
	@Override
	public void setSession(Map<String, Object> arg0) {
		this.session = arg0;
	}

	@Override
	public String execute() throws Exception {
		return null;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}

	public void setiGoodsBuz(IGoodsBuz iGoodsBuz) {
		this.iGoodsBuz = iGoodsBuz;
	}

	public void setiCategoryBuz(ICategoryBuz iCategoryBuz) {
		this.iCategoryBuz = iCategoryBuz;
	}

	public void setPageUtils(PageUtils pageUtils) {
		this.pageUtils = pageUtils;
	}

	public void setPage(Page page) {
		this.page = page;
	}

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		this.request = arg0;
	}

	public void setiConditionBuz(IConditionBuz iConditionBuz) {
		this.iConditionBuz = iConditionBuz;
	}

}
