package com.jb.action;

import javax.servlet.ServletContext;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.jb.listener.ContextLoaderListenerOverWrite;
import com.opensymphony.xwork2.Action;

public class IndexAction implements Action {

	private ServletContext application;
	private ApplicationContext ctx;
	
	@Override
	public String execute() throws Exception {
		//获取application对象
		application = ServletActionContext.getServletContext();
		ctx=WebApplicationContextUtils.getWebApplicationContext(application); 
		ContextLoaderListenerOverWrite ctlow = new ContextLoaderListenerOverWrite();
		ctlow.readyData(ctx, application);
		return SUCCESS;
	}

}
