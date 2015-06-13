package com.jb.buz.Impl;

import java.awt.BasicStroke;
import java.awt.Color;
import java.awt.Font;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.collections.map.HashedMap;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.StandardChartTheme;
import org.jfree.chart.labels.StandardPieSectionLabelGenerator;
import org.jfree.chart.labels.StandardPieToolTipGenerator;
import org.jfree.chart.plot.PiePlot;
import org.jfree.data.general.DefaultPieDataset;

import com.jb.buz.IChartBuz;
import com.jb.dao.IGoodsDao;
import com.jb.pojo.Goods;

public class IChartBuzImpl implements IChartBuz {

	private IGoodsDao iGoodsDao;
	
	public JFreeChart createPieChart(Map<String, Integer> pieData) {
	    //创建主题样式  
       StandardChartTheme standardChartTheme=new StandardChartTheme("CN");  
       //设置标题字体  
       standardChartTheme.setExtraLargeFont(new Font("Microsoft Yahei",20,36));  
       //设置图例的字体  
       standardChartTheme.setRegularFont(new Font("宋体",Font.PLAIN,14));  
       //设置轴向的字体  
       standardChartTheme.setLargeFont(new Font("宋体",Font.PLAIN,14));  
       //应用主题样式  
       ChartFactory.setChartTheme(standardChartTheme); 
		
		DefaultPieDataset data = getDataSet(pieData);
		JFreeChart chart = ChartFactory.createPieChart3D("销量统计饼状图", // 图表标题
				data, true, // 是否显示图例
				false, false);
		PiePlot plot = (PiePlot) chart.getPlot();
		resetPiePlot(plot);
		return chart;
	}

	private static void resetPiePlot(PiePlot plot) {
		String unitSytle = "{0}={1}({2})";

		plot.setNoDataMessage("No Data , Please Query Again");
		plot.setNoDataMessagePaint(Color.red);

		// 指定 section 轮廓线的厚度(OutlinePaint不能为null)
		plot.setOutlineStroke(new BasicStroke(2));

		// 设置第一个 section 的开始位置，默认是12点钟方向
		plot.setStartAngle(120);

		plot.setToolTipGenerator(new StandardPieToolTipGenerator(unitSytle,
				NumberFormat.getNumberInstance(), new DecimalFormat("0.00%")));

		// 指定图片的透明度
		plot.setForegroundAlpha(0.65f);

		// 引出标签显示样式
		plot.setLabelGenerator(new StandardPieSectionLabelGenerator(unitSytle,
				NumberFormat.getNumberInstance(), new DecimalFormat("0.00%")));

		// 图例显示样式
		plot.setLegendLabelGenerator(new StandardPieSectionLabelGenerator(
				unitSytle, NumberFormat.getNumberInstance(), new DecimalFormat(
						"0.00%")));
	}

	private static DefaultPieDataset getDataSet(Map<String, Integer> pieData) {
		DefaultPieDataset dataset = new DefaultPieDataset();
		Set<String> key = pieData.keySet();
		for(String s:key){
			dataset.setValue(s, pieData.get(s));
		}
		return dataset;
	}
	
	@SuppressWarnings("unchecked")
	public Map<String,Integer> getPieData(){
		List<Goods> pieData = iGoodsDao.getPieData();
		Map<String,Integer> map = new HashedMap();
		for(Goods g:pieData){
			if(null!=map.get(g.getCategory().getName())){
				Integer i = map.get(g.getCategory().getName());
				map.put(g.getCategory().getName(), g.getSnum()+i);
			}else{
				map.put(g.getCategory().getName(), g.getSnum());
			}
		}
		return map;
	}

	public void setiGoodsDao(IGoodsDao iGoodsDao) {
		this.iGoodsDao = iGoodsDao;
	}
}
