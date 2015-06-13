package com.jb.listener;


import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.jb.buz.ICategoryBuz;

public class ApplicationListener implements ServletContextListener {

	/**
	 * 容器启动时，不能注入iCategoryBuz对象，暂未使用此监听器
	 */
	@SuppressWarnings("unused")
	private ICategoryBuz iCategoryBuz;
	
	public void contextDestroyed(ServletContextEvent arg0) {
		System.out.println("application 消失了 .... ");
	}

	public void contextInitialized(ServletContextEvent arg0) {
		System.out.println("application 刚刚生成  .... ");
		
	}

	public void setiCategoryBuz(ICategoryBuz iCategoryBuz) {
		this.iCategoryBuz = iCategoryBuz;
	}

}
