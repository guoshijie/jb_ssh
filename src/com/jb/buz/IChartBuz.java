package com.jb.buz;

import java.util.Map;

import org.jfree.chart.JFreeChart;

public interface IChartBuz {

	public JFreeChart createPieChart(Map<String, Integer> pieData);
	public Map<String,Integer> getPieData();
}
