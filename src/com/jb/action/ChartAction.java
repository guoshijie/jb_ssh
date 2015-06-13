package com.jb.action;

import java.util.Map;

import org.apache.struts2.interceptor.ApplicationAware;
import org.jfree.chart.JFreeChart;

import com.jb.buz.IChartBuz;
import com.opensymphony.xwork2.Action;

public class ChartAction implements Action,ApplicationAware{

	//必须要定义此成员变量
	private JFreeChart chart; 
	private IChartBuz iChartBuz;
	Map<String, Object> application;
	
	//销量统计饼状图
	@SuppressWarnings("unchecked")
	public String createPieChart() throws Exception {
		//饼状图
		Map<String, Integer> pieData = (Map<String, Integer>)application.get("pieData");
		chart = iChartBuz.createPieChart(pieData);
		return SUCCESS;
	}
	
	@Override
	public String execute() throws Exception {
		return null;
	}

	public JFreeChart getChart() {
		return chart;
	}

	public void setChart(JFreeChart chart) {
		this.chart = chart;
	}

	public void setiChartBuz(IChartBuz iChartBuz) {
		this.iChartBuz = iChartBuz;
	}

	@Override
	public void setApplication(Map<String, Object> arg0) {
		this.application = arg0;
	}

}
