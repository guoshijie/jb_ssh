package com.jb.listener;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.jb.buz.ICategoryBuz;
import com.jb.buz.IChartBuz;
import com.jb.buz.IGoodsBuz;
import com.jb.buz.INewsBuz;
import com.jb.pojo.Category;
import com.jb.pojo.Goods;
import com.jb.pojo.News;

public class ContextLoaderListenerOverWrite extends ContextLoaderListener {

	/** 
	 * 整合两个listener到一个类中,即自己写的缓存数据监听器和spring的ContextLoaderListener监听器
	 * 这样就能保证Spring的IOC容器先于自定义的缓存监听器初始化,在缓存监听器加载的时候就能使用依赖注入的实例.
	 * @description 重写ContextLoaderListener的contextInitialized方法 
	 */  
	
	private IGoodsBuz iGoodsBuz;
	private ICategoryBuz iCategoryBuz;
	private INewsBuz iNewsBuz;
	private IChartBuz iChartBuz;
	
	@Override
	public void contextInitialized(ServletContextEvent event) {
		super.contextInitialized(event);
		ApplicationContext applicationContext = WebApplicationContextUtils.getWebApplicationContext(event.getServletContext());  
		ServletContext application = event.getServletContext();
		readyData(applicationContext, application);
	}
	
	//容器启动时，准备数据
	public void readyData(ApplicationContext applicationContext,ServletContext application){
		//获取bean  
		iGoodsBuz = (IGoodsBuz) applicationContext.getBean("iGoodsBuz");   
		iCategoryBuz =(ICategoryBuz)applicationContext.getBean("iCategoryBuz");   
		iNewsBuz =(INewsBuz)applicationContext.getBean("iNewsBuz");   
		iChartBuz =(IChartBuz)applicationContext.getBean("iChartBuz");   
	  
		// 具体业务代码
		List<Goods> goods = iGoodsBuz.getGoods();
		application.setAttribute("goods", goods);
		
		//前台首页 直通车
		List<Goods> zhitongche = iGoodsBuz.getZhiTongChe();
		application.setAttribute("zhitongche", zhitongche);
		
		//前台搜索准备数据
		List<Category> listByLevel = iCategoryBuz.getCategoryListByLevel(3);
		application.setAttribute("indexSearchListByLevel", listByLevel);
		
		//查询首页显示的通告list
		List<News> listShowIndex = iNewsBuz.getListShowIndex();
		application.setAttribute("listShowIndex", listShowIndex);
		
		//首页商品推荐，按销量排序的5个商品list
		List<Goods> goodsListOrderBySnum = iGoodsBuz.getGoodsListOrderBySnum();
		application.setAttribute("goodsListOrderBySnum", goodsListOrderBySnum);
		
		//首页最新上架，按上架时间排序的5个商品list
		List<Goods> goodsListOrderByPubTime = iGoodsBuz.getGoodsListOrderByPubTime();
		application.setAttribute("goodsListOrderByPubTime", goodsListOrderByPubTime);
		
		//首页手机数码
		List<Goods> phoneAndDigital = iGoodsBuz.getPhoneAndDigital();
		application.setAttribute("phoneAndDigital", phoneAndDigital);
		
		//前台首页   家用电器
		List<Goods> appliance = iGoodsBuz.getAppliance();
		application.setAttribute("appliance", appliance);
		
		//前台首页   体育用品
		List<Goods> sports = iGoodsBuz.getSportsGoods();
		application.setAttribute("sports", sports);
		
		//前台首页   外设产品
		List<Goods> computerParts = iGoodsBuz.getComputerParts();
		application.setAttribute("computerParts", computerParts);
		
		//前台首页   礼品箱包
		List<Goods> giftBags = iGoodsBuz.getGiftBags();
		application.setAttribute("giftBags", giftBags);
		
		//前台首页   热评商品
		List<Goods> highDiscuss = iGoodsBuz.getHighDiscuss();
		application.setAttribute("highDiscuss", highDiscuss);
				
		//为后台销量统计饼状图准备数据
		Map<String, Integer> pieData = iChartBuz.getPieData();
		application.setAttribute("pieData", pieData);
	}

}
