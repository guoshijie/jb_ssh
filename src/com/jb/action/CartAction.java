package com.jb.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.jb.buz.IAddressBuz;
import com.jb.buz.ICartBuz;
import com.jb.buz.IGoodsBuz;
import com.jb.pojo.Address;
import com.jb.pojo.Goods;
import com.jb.pojo.Items;
import com.jb.pojo.User;
import com.opensymphony.xwork2.Action;

public class CartAction implements Action,ServletRequestAware,SessionAware {

	private HttpServletRequest request;
	private Goods goods;
	private IGoodsBuz iGoodsBuz;
	private ICartBuz iCartBuz;
	private IAddressBuz iAddressBuz;
	Map<String,Object> session;
	
	//商品详情页面，点击立即购买，所调用的方法
	public String buyNow(){
		obtainTheUsersAddress();
		Integer id = Integer.parseInt(request.getParameter("gid"));
		Goods g = iGoodsBuz.getGoodsById(id);
		Map<Integer, Items> buyNow = iCartBuz.buyNow(g);
		session.put("jb_newCart", buyNow);
		putGoodsCountAndSumPriceToSession2(buyNow);
		return SUCCESS;
	}
	
	//jb_cart跳转到jb_cart_02.jsp所用到的action
	@SuppressWarnings("unchecked")
	public String settleAccounts(){
		obtainTheUsersAddress();
		Map<Integer,Items> old_cart = session.get("jb_cart")==null?new HashMap<Integer , Items>() : (Map<Integer,Items>)session.get("jb_cart");
		String[] parameterValues = request.getParameterValues("gid_array");
		List<Map<Integer, Items>> list = iCartBuz.obtainOrderMapAndNoOrderMap(parameterValues, old_cart);
		Map<Integer, Items> newCart = list.get(0);
		Map<Integer, Items> oldCart = list.get(1);
		putGoodsCountAndSumPriceToSession(oldCart);
		putGoodsCountAndSumPriceToSession2(newCart);
		session.put("jb_newCart", newCart);
		session.put("jb_cart", oldCart);
		return SUCCESS;
	}
	
	//取得当前登录用户的所有收货地址
	public void obtainTheUsersAddress(){
		User u = (User)request.getSession().getAttribute("jbuser");
		List<Address> list = iAddressBuz.getAddress(u);
		session.put("list_address", list);
	}
	
	//添加商品到购物车,商品详情页面
	public String addGoodsToCart(){
		session.remove("addCartSuccess");
		if(null==session.get("jbname")){
			request.setAttribute("login", "请先登录");
			return ERROR;
		}else{
			addGoodsToCommon();
			return SUCCESS;
		}
	}
	
	//Ajax从购物车Session里增加一个商品
	public String addGoodsToCartByAjax(){
		addGoodsToCommon();
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public void addGoodsToCommon(){
		Map<Integer,Items> old_cart = session.get("jb_cart")==null?new HashMap<Integer , Items>() : (Map<Integer,Items>)session.get("jb_cart");
		Integer id = Integer.parseInt(request.getParameter("gid"));
		Goods g = iGoodsBuz.getGoodsById(id);
		Map<Integer, Items> newCart = iCartBuz.addGoodsToCart(g, old_cart);
		request.setAttribute("addCartSuccess", "addCartSuccess");
		putGoodsCountAndSumPriceToSession(newCart);
		session.put("jb_cart", newCart);
	}
	
	//Ajax从购物车Session里减去一个商品
	@SuppressWarnings("unchecked")
	public String cutGoodsToCart(){
		Map<Integer,Items> old_cart = session.get("jb_cart")==null?new HashMap<Integer , Items>() : (Map<Integer,Items>)session.get("jb_cart");
		String gid = request.getParameter("gid");
		Integer id = Integer.parseInt(gid);
		Goods goods_01 = iGoodsBuz.getGoodsById(id);
		Map<Integer, Items> newCart = iCartBuz.cutGoodsToCart(goods_01, old_cart);
		putGoodsCountAndSumPriceToSession(newCart);
		session.put("jb_cart", newCart);
		return SUCCESS;
	}
	
	//从购物车中批量删除商品
	@SuppressWarnings("unchecked")
	public String delBatchGoodsFromCart(){
		Map<Integer,Items> old_cart = session.get("jb_cart")==null?new HashMap<Integer , Items>() : (Map<Integer,Items>)session.get("jb_cart");
		String[] gid_array = request.getParameterValues("gid_array");
		Map<Integer, Items> newCart = iCartBuz.delGoodsFormCart(gid_array, old_cart);
		putGoodsCountAndSumPriceToSession(newCart);
		session.put("jb_cart", newCart);
		return SUCCESS;
	}
	
	//从购物车中删除某商品
	@SuppressWarnings("unchecked")
	public String delGoodsFromCart(){
		Map<Integer,Items> old_cart = session.get("jb_cart")==null?new HashMap<Integer , Items>() : (Map<Integer,Items>)session.get("jb_cart");
		Integer id = Integer.parseInt(request.getParameter("gid"));
		Map<Integer, Items> new_cart = iCartBuz.delGoodsFormCart(id, old_cart);
		session.put("jb_cart", new_cart);
		putGoodsCountAndSumPriceToSession(new_cart);
		return SUCCESS;
	}
	
	//计算购物车中的商品数量和商品总价，并放入session中
	public void putGoodsCountAndSumPriceToSession(Map<Integer, Items> newCart){
		Double sumPrice = iCartBuz.getCartSumPrice(newCart);
		session.put("sumPrice", sumPrice);
		Integer sumCount = iCartBuz.getCartGoodsSumCount(newCart);
		session.put("sumCount", sumCount);
	}
	
	//计算购物车中的商品数量和商品总价，并放入session中
	public void putGoodsCountAndSumPriceToSession2(Map<Integer, Items> newCart){
		Double sumPrice = iCartBuz.getCartSumPrice(newCart);
		session.put("sumPrice2", sumPrice);
		Integer sumCount = iCartBuz.getCartGoodsSumCount(newCart);
		session.put("sumCount2", sumCount);
	}
	
	@Override
	public String execute() throws Exception {
		return null;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	public Goods getGoods() {
		return goods;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}

	public void setiGoodsBuz(IGoodsBuz iGoodsBuz) {
		this.iGoodsBuz = iGoodsBuz;
	}

	@Override
	public void setSession(Map<String, Object> arg0) {
		this.session = arg0;
	}

	public void setiCartBuz(ICartBuz iCartBuz) {
		this.iCartBuz = iCartBuz;
	}

	public void setiAddressBuz(IAddressBuz iAddressBuz) {
		this.iAddressBuz = iAddressBuz;
	}
	
}
