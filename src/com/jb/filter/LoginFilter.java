package com.jb.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginFilter implements Filter {

	private FilterConfig filterConfig;

	public void destroy() {
		System.out.println("=======LoginFilter.destroy()========");
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest r = (HttpServletRequest)request;
		HttpServletResponse res = (HttpServletResponse)response;
		HttpSession session = r.getSession();
		
		String username = (String)session.getAttribute("jbname");
		String rp = r.getServletPath();
		
		String myjb = this.filterConfig.getInitParameter("myjb");
		String cart = this.filterConfig.getInitParameter("cart");
		
		if(null == username && (rp.endsWith(myjb)||rp.endsWith(cart))){
			r.setAttribute("login", "请先登录");
			res.sendRedirect("jb_login.jsp");
		}else{
			chain.doFilter(request, response);
		}
	}

	public void init(FilterConfig filterConfig) throws ServletException {
		this.filterConfig = filterConfig;
		System.out.println("========LoginFilter.init()======");
	}

}
