package com.jb.action;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.jb.buz.ICategoryBuz;
import com.jb.buz.ICollectBuz;
import com.jb.buz.IDiscussBuz;
import com.jb.buz.IGoodsBuz;
import com.jb.pagination.Page;
import com.jb.pagination.PageUtils;
import com.jb.pojo.Category;
import com.jb.pojo.Discuss;
import com.jb.pojo.Goods;
import com.jb.pojo.User;
import com.jb.utils.FileUpUtils;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;

public class GoodsAction implements Action,ModelDriven<Goods>,ServletRequestAware,SessionAware {

	private User user;
	private Goods goods;
	private IGoodsBuz iGoodsBuz;
	private ICategoryBuz iCategoryBuz;
	private ICollectBuz iCollectBuz;
	private IDiscussBuz iDiscussBuz;
	private PageUtils pageUtils;
	
	private File[] upload;
	private String[] uploadContentType;
	private String[] uploadFileName;
	private Category category;
	private int categoryId;
	HttpServletRequest request;
	Map<String,Object> session;
	private Page page;
	private int pageSize = 4;
	
	//后台采购某商品
	public String adminBuyGoods(){
		String num = request.getParameter("buyNum");
		Integer n = Integer.parseInt(num);
		String res = iGoodsBuz.addGoodsNum(goods.getGid(), n);
		request.setAttribute("meg", "恭喜，采购成功！");
		return res;
	}
	
	//后台修改商品信息
	public String adminUpdateGoods(){
		if(null!=upload&&null!=uploadContentType&&null!=uploadFileName){
			String path = FileUpUtils.doFilesUp(upload, uploadFileName, "images/img");
			goods.setImg(path);
		}
		String updateGoods = iGoodsBuz.updateGoods(goods);
		if("success".equals(updateGoods)){
			request.setAttribute("meg", "更新成功");
			return SUCCESS;
		}
		return ERROR;
	}
	
	//后台商品管理查询某商品的详细信息
	public String adminGetGoodsById(){
		int gid = Integer.parseInt(request.getParameter("gid"));
		String s = request.getParameter("meg");
		Goods g = iGoodsBuz.getGoodsById(gid);
		request.setAttribute("admin_goodsInfo", g);
		if(null!=s){
			request.setAttribute("meg", s);
		}
		return SUCCESS;
	}
	
	//后台查询仓库中的商品，分页显示，仓库中的商品status为0;
	public String getStorageGoodsByPage(){
		Integer status = 0;
		List<Goods> allStorageGoods = iGoodsBuz.getAllStorageGoods(status);
		if(null!=allStorageGoods&&allStorageGoods.size()>0){
			int pageNow = 1;
			String pn = request.getParameter("pageNow");
			if(null!=pn){
				pageNow = Integer.parseInt(pn);
			}
			page = pageUtils.createPage(allStorageGoods.size(), 6, pageNow);
			List<Goods> storageGoodsByPage = iGoodsBuz.getStorageGoodsByPage(page,status);
			page.setList(storageGoodsByPage);
			session.put("storagePage", page);
			return SUCCESS;
		}
		return ERROR;
	}
	
	//后台批量上架选中商品
	public String putaway(){
		String[] gid = request.getParameterValues("id");
		boolean b = iGoodsBuz.putaway(gid);
		if(b){
			request.setAttribute("meg", "商品上架成功！");
			return SUCCESS;
		}else{
			request.setAttribute("meg", "上架失败");
			return SUCCESS;
		}
	}
	
	//后台批量下架选中商品
	public String removeOffShelves(){
		String[] gid = request.getParameterValues("id");
		boolean b = iGoodsBuz.removeOffGoodsPatch(gid);
		if(b){
			request.setAttribute("meg", "商品下架成功！");
			return SUCCESS;
		}else{
			request.setAttribute("meg", "下架失败");
			return SUCCESS;
		}
	}
	
	//后台跳转到商品管理，查询出所有商品，并分页显示
	public String manageAllGoods(){
		String condition = (String) request.getParameter("condition");
		if(null!=condition&&condition.equals("all")){
			session.remove("categoryId");
			session.remove("keywords");
			session.remove("orderby");
		}else{
			String categoryId = (String) request.getParameter("categoryId");
			String keywords = (String) request.getParameter("keyword");
			String orderby = (String) request.getParameter("orderby");
			if(null!=categoryId){
				session.put("categoryId", categoryId);
			}
			if(null!=keywords){
				session.put("keywords", keywords);
			}
			if(null!=orderby){
				session.put("orderby", orderby);
			}
		}
		String session_categoryId = (String) session.get("categoryId");
		String session_keywords = (String) session.get("keywords");
		String session_orderby = (String) session.get("orderby");
		List<Goods> allGoods = iGoodsBuz.getAllGoodsByCondition(session_categoryId, session_keywords, session_orderby);
		if(null!=allGoods&&allGoods.size()>0){
			int pageNow = 1;
			String pn = request.getParameter("pageNow");
			if(null!=pn){
				pageNow = Integer.parseInt(pn);
			}
			page = pageUtils.createPage(allGoods.size(), 6, pageNow);
			List<Goods> goodsManageByPage = iGoodsBuz.getGoodsByPage(page,session_categoryId, session_keywords, session_orderby);
			page.setList(goodsManageByPage);
			session.put("allGoodsByPage", page);
			return SUCCESS;
		}
		return ERROR;
	}
	
	//添加商品
	public String addGoods(){
		String path = FileUpUtils.doFilesUp(upload, uploadFileName, "images/img");
		goods.setImg(path);
		category = iCategoryBuz.getCategory(this.getCategoryId());
		goods.setCategory(category);
		iGoodsBuz.addGoods(goods);
		ActionContext.getContext().put("result", "商品添加成功");
		System.out.println(goods);
		System.out.println("图片组合后丶路径是 ："+path);
		return SUCCESS;
	}
	
	//根据id查询某一商品的详细信息
	public String getGoodsById(){
		int gid = Integer.parseInt(request.getParameter("gid"));
		Goods g = iGoodsBuz.getGoodsById(gid);
		session.put("goods", g);
		List<Discuss> allDiscussByGoods = iDiscussBuz.getAllDiscussByGoods(g,0);
		if(null!=allDiscussByGoods&&allDiscussByGoods.size()>0){
			int pageNow = 1;
			String pn = request.getParameter("pageNow");
			if(null!=pn){
				pageNow = Integer.parseInt(pn);
			}
			page = pageUtils.createPage(allDiscussByGoods.size(), pageSize, pageNow);
			List<Discuss> discussByPage = iDiscussBuz.getDiscussByPage(g, page,0);
			session.put("goodsDetailsDiscussByPage", discussByPage);
		}
		session.put("goodsDetailsPage", page);
		User u = (User)request.getSession().getAttribute("jbuser");
		if(null!=u){
			boolean b = iCollectBuz.isCollectGoods(u, g);
			ActionContext.getContext().put("isCollectGoods", b);
		}
		int num = iCollectBuz.getUserNumCollectTheGoods(g);
		ActionContext.getContext().put("userCollectNum", num);
		return SUCCESS;
	}
	
	//跳转到所有商品所用到的action
	public String searchGoods(){
		List<Category> categoryListByLevel = iCategoryBuz.getCategoryListByLevel(2);
		session.put("categoryListByLevel", categoryListByLevel);
		session.remove("conditions");
		session.remove("search_text");
		return SUCCESS;
	}
	
	@Override
	public String execute() throws Exception {
		return manageAllGoods();
	}

	@Override
	public Goods getModel() {
		return goods;
	}

	public Goods getGoods() {
		return goods;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}

	public File[] getUpload() {
		return upload;
	}

	public void setUpload(File[] upload) {
		this.upload = upload;
	}

	public String[] getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String[] uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public String[] getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String[] uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public void setiGoodsBuz(IGoodsBuz iGoodsBuz) {
		this.iGoodsBuz = iGoodsBuz;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public void setiCategoryBuz(ICategoryBuz iCategoryBuz) {
		this.iCategoryBuz = iCategoryBuz;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public void setiCollectBuz(ICollectBuz iCollectBuz) {
		this.iCollectBuz = iCollectBuz;
	}

	@Override
	public void setSession(Map<String, Object> arg0) {
		this.session=arg0;
	}

	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}

	public void setiDiscussBuz(IDiscussBuz iDiscussBuz) {
		this.iDiscussBuz = iDiscussBuz;
	}

	public void setPageUtils(PageUtils pageUtils) {
		this.pageUtils = pageUtils;
	}

}
