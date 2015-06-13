package com.jb.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;

import com.jb.buz.ILevelBuz;
import com.jb.buz.IUserBuz;
import com.jb.pagination.Page;
import com.jb.pagination.PageUtils;
import com.jb.pojo.Level;
import com.jb.pojo.User;
import com.jb.properties.Message;
import com.jb.utils.FileUpUtils;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@SuppressWarnings("serial")
public class UserAction extends ActionSupport implements ModelDriven<User>,ServletRequestAware,ServletResponseAware,SessionAware {

	private User user;
	private IUserBuz iUserBuz;
	private ILevelBuz iLevelBuz;
	HttpServletRequest request;
	HttpServletResponse response;
	private Page page;
	private PageUtils pageUtils;
	int pageNow = 1;
	int pageSize = 10;
	String condition = "allUser";
	Map<String,Object> session;
	
	private File upload;
	private String[] uploadContentType;
	private String uploadFileName;
	
	//前台修改用户信息
	public String updateUserInfo(){
		User u = (User)request.getSession().getAttribute("jbuser");
		if(null!=uploadFileName){
			String path = FileUpUtils.doFileUp(upload, uploadFileName, "images/headImg");
			user.setHeadImg(path);
		}
		User user2 = iUserBuz.updateUser(user,u);
		request.setAttribute("meg", Message.USER_UPDATE_SUCCESS);
		session.put("jbuser", user2);
		if(null!=user2){
			return SUCCESS;
		}
		return ERROR;
	}
	
	//查询当前登录用户的相关信息
	public String queryCurUserDetails(){
		User u = (User)request.getSession().getAttribute("jbuser");
		request.setAttribute("curUser", u);
		return SUCCESS;
	}
	
	public User getModel() {
		return user;
	}
	
	public String addUser() throws Exception{
		String res = iUserBuz.addUser(user);
		ActionContext.getContext().put("result", user.getUname());
		ActionContext.getContext().put("meg", "添加成功");
		return res;
	}
	
	public void hasUser(){
		response.setContentType("text/html");
		PrintWriter out;
		try {
			out = response.getWriter();
			//接收客户端请求，获得校验名称
			
			//这里也可从ActionContext 中去取
//			String name = ServletActionContext.getRequest().getParameter("uname");
//			String uname = ((String[])ActionContext.getContext().getParameters().get("uname"))[0];
			String uname = request.getParameter("uname");
			boolean b = iUserBuz.hasUser(uname);
			out.print(b);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@SuppressWarnings("unchecked")
	public String getUserByPage() throws Exception{
		
		String con = request.getParameter("condition");
		if(null!=con){
			condition = con;
		}
		String str = request.getParameter("pageNow");
		if(null!=str){
			pageNow = Integer.parseInt(str);
		}else{
			request.getSession().removeAttribute("searchUserByName");
		}
		if(condition.equals("allUser")){
			int pageAllSize = iUserBuz.getUserNum();
			page = pageUtils.createPage(pageAllSize, pageSize, pageNow);
			page.setList(iUserBuz.getPageList(page));
		}
		if(condition.equals("searchUserByName")){
			List<User> pageUser = new ArrayList<User>();
			int pageAllSize = 0;
			String name = request.getParameter("uname");
			List<User>list = iUserBuz.searchUserByName(name);
			if(list.size()>0){
				request.getSession().setAttribute("searchUserByName", list);
			} 
			pageUser = (List<User>)request.getSession().getAttribute("searchUserByName");
			if(null!=pageUser){
				pageAllSize = pageUser.size();
			}
			page = pageUtils.createPage(pageAllSize, pageSize, pageNow);
			page.setList(getSearchUserByNamePage(pageUser, page));
		}
		ActionContext.getContext().put("page", page);
		ActionContext.getContext().put("condition", condition);
		
		return SUCCESS;
	}
	
	public List<User> getSearchUserByNamePage(List<User> list,Page page){
		List<User> l = new ArrayList<User>();
		int num = 0;
		if(null == list){
			return null;
		}
		if((page.getPageNow()*page.getPageSize())>list.size()){
			num = list.size();
		}else{
			num = page.getPageNow()*page.getPageSize();
		}
		System.out.println("num:"+num);
		for(int i = page.getBeginNum();i<num;i++){
			l.add(list.get(i));
		}
		return l;
	}
	
	
	public String delUser(){
		String[] aid = request.getParameterValues("id");
		boolean b = iUserBuz.delUser(aid);
		if(b){
			return SUCCESS;
		}else{
			request.setAttribute("meg", "删除失败");
			return SUCCESS;
		}
	}
	
	public String modityUser(){
		int id = Integer.parseInt(request.getParameter("level_id"));
		Level l = iLevelBuz.getLevel(id);
		user.setLevel(l);
		String s = iUserBuz.modifyUser(user);
		return s;
	}
	
	public String searchUserById() throws Exception{
		int id = Integer.parseInt(request.getParameter("id"));
		User u = iUserBuz.searchUserById(id);
		System.out.println(u);
		ActionContext.getContext().put("user", u);
		return SUCCESS;
	}
	
	//用户帐户充值
	public String recharge(){
		String charge = request.getParameter("charge");
		Double money = Double.parseDouble(charge);
		User u = (User)request.getSession().getAttribute("jbuser");
		User newUser = iUserBuz.modifyUserMoney(u, money);
		session.put("money", newUser.getMoney());
		session.put("jbuser", newUser);
		request.setAttribute("rechargeMeg", "恭喜,充值成功!");
		return SUCCESS;
	}
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public void setiUserBuz(IUserBuz iUserBuz) {
		this.iUserBuz = iUserBuz;
	}

	public void setiLevelBuz(ILevelBuz iLevelBuz) {
		this.iLevelBuz = iLevelBuz;
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

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

	public String[] getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String[] uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	
	
}
