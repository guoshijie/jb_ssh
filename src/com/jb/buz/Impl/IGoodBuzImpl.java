package com.jb.buz.Impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.jb.buz.IGoodsBuz;
import com.jb.dao.ICategoryDao;
import com.jb.dao.IDiscussDao;
import com.jb.dao.IGoodsDao;
import com.jb.pagination.Page;
import com.jb.pojo.Category;
import com.jb.pojo.Discuss;
import com.jb.pojo.Goods;

public class IGoodBuzImpl implements IGoodsBuz {

	private IGoodsDao iGoodsdao;
	private IDiscussDao iDiscussDao;
	private ICategoryDao iCategoryDao;
	
	//前台首页   热评商品
	public List<Goods> getHighDiscuss(){
		List<Goods> allGoods = iGoodsdao.getAllGoods();
		List<Goods> list = sortGoodsListByDiscussNumBigToSmall(allGoods);
		List<Goods> newList = new ArrayList<Goods>();
		for(int i=0;i<5;i++){
			newList.add(list.get(i));
		}
		return newList;
	}
	
	//按照商品的评论数由大到小排序
	public List<Goods> sortGoodsListByDiscussNumBigToSmall(List<Goods> preList){
		for(int i=0;i<preList.size()-1;i++){
			for(int j=0;j<preList.size()-1-i;j++){
				if(preList.get(j).getDiscusses().size()<preList.get(j+1).getDiscusses().size()){
					Goods temp = preList.get(j+1);
					preList.set(j+1, preList.get(j));
					preList.set(j, temp);
				}
			}
		}
		return preList;
	}
	
	//前台首页   手机数码
	public List<Goods> getPhoneAndDigital(){
		return getIndexShowCommon(8);
	}
	
	//前台首页   家用电器
	public List<Goods> getAppliance(){
		return getIndexShowCommon(15);
	}
	
	//前台首页   体育用品
	public List<Goods> getSportsGoods(){
		return getIndexShowCommon(13);
	}
	
	//前台首页   外设产品
	public List<Goods> getComputerParts(){
		return getIndexShowCommonTwo(89);
	}
	
	//前台首页   礼品箱包
	public List<Goods> getGiftBags(){
		return getIndexShowCommon(11);
	}
	
	/**
	 * @param categoryId 一级类型的id
	 * @return List<Goods>
	 */
	//前台快捷显示共用方法
	public List<Goods> getIndexShowCommon(Integer categoryId){
		Category category = iCategoryDao.getCategory(categoryId);
		List<Category> childList = iCategoryDao.getChildList(category);
		List<Category> childListByCollection = iCategoryDao.getChildListByCollection(childList);
		List<Goods> listByThreeLevel = iGoodsdao.getGoodsListByThreeLevel(childListByCollection);
		return listByThreeLevel;
	}
	
	/**
	 * @param categoryId 二级类型的id
	 * @return List<Goods>
	 */
	//前台快捷显示共用方法
	public List<Goods> getIndexShowCommonTwo(Integer categoryId){
		Category category = iCategoryDao.getCategory(categoryId);
		List<Category> childList = iCategoryDao.getChildList(category);
		List<Goods> listByThreeLevel = iGoodsdao.getGoodsListByThreeLevel(childList);
		return listByThreeLevel;
	}
	
	//后台采购某商品
	public String addGoodsNum(Integer gid,Integer num){
		Goods g = iGoodsdao.getGoodsById(gid);
		g.setGnum(g.getGnum()+num);
		String res = iGoodsdao.updateGoods(g);
		return res;
	}
	
	//后台更新商品信息
	public String updateGoods(Goods newGoods){
		Goods oldGoods = iGoodsdao.getGoodsById(newGoods.getGid());
		oldGoods.setGname(newGoods.getGname());
		oldGoods.setSprice(newGoods.getSprice());
		oldGoods.setGnum(newGoods.getGnum());
		oldGoods.setNoPostage(newGoods.getNoPostage());
		oldGoods.setArea(newGoods.getArea());
		if(null!=newGoods.getImg()){
			oldGoods.setImg(newGoods.getImg());
		}
		return iGoodsdao.updateGoods(oldGoods);
	}
	
	//后台按条件查询商品
	public List<Goods> searchGoodsByMulityCondition(String categoryId,String keyword,String orderby){
		return null;
	}
	
	//后台根据商品的status查看商品,分页显示
	public List<Goods> getStorageGoodsByPage(Page page,Integer status){
		return iGoodsdao.getStorageGoodsByPage(page, status);
	}
	
	//根据商品的status来查询相应的商品列表
	public List<Goods> getAllStorageGoods(Integer status){
		return iGoodsdao.getAllStorageGoods(status);
	}
	
	//后台批量上架选中商品
	public boolean putaway(String[] gidArray){
		int goodsPatch = iGoodsdao.putaway(gidArray);
		if(goodsPatch==gidArray.length){
			return true;
		}
		return false;
	}
		
	//后台批量下架选中商品
	public boolean removeOffGoodsPatch(String[] gidArray){
		int goodsPatch = iGoodsdao.removeOffGoodsPatch(gidArray);
		if(goodsPatch==gidArray.length){
			return true;
		}
		return false;
	}
	
	//后台商品管理，分页显示商品
	public List<Goods> getGoodsByPage(Page page,String categoryId,String keyword,String orderby){
		Category category = null;
		if(null!=categoryId&&categoryId!=""){
			int cid = Integer.parseInt(categoryId);
			category = iCategoryDao.getCategory(cid);
		}
		return iGoodsdao.getGoodsByPage(page, category, keyword, orderby);
	}
	
	//查询所有商品
	public List<Goods> getAllGoods(){
		return iGoodsdao.getAllGoods();
	}
	
	//后台按条件查询所有商品
	public List<Goods> getAllGoodsByCondition(String categoryId,String keyword,String orderby){
		Category category = null;
		if(null!=categoryId&&categoryId!=""){
			int cid = Integer.parseInt(categoryId);
			category = iCategoryDao.getCategory(cid);
		}
		return iGoodsdao.getAllGoodsByCondition(category, keyword, orderby);
	}
	
	//查询某三级类型下的所有商品
	public List<Goods> queryGoodsListByThreeLevel(List<Category> category,String sort,Map<String,Object> conditions){
		return iGoodsdao.queryGoodsListByThreeLevel(category,sort,conditions);
	}
	
	//多条件查询商品
	public List<Goods> queryGoodsByConditions(Map<String,Object> conditions,String sort){
		List<Category> childListThreeLevel = null;
		if(null!=conditions&&conditions.size()>0){
			String categoryTwoLevel = (String)conditions.get("categorytwolevel");
			if(null!=categoryTwoLevel){
				childListThreeLevel = iCategoryDao.getChildList(iCategoryDao.getCategoryByName(categoryTwoLevel));
			}
		}
		return iGoodsdao.queryGoodsByConditions(conditions,childListThreeLevel,sort);
	}
	
	@Override
	public void addGoods(Goods goods) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = format.format(new Date());
		goods.setModifyTime(date);
		iGoodsdao.addGoods(goods);
	}
	
	//获得首页底部8件商品
	public List<Goods> getGoods(){
		List<Goods> goods = iGoodsdao.getGoods();
		return goods;
	}
	
	public void setiGoodsdao(IGoodsDao iGoodsdao) {
		this.iGoodsdao = iGoodsdao;
	}
	
	public List<Goods> getZhiTongChe(){
		List<Goods> goods = iGoodsdao.getZhiTongChe();
		return goods;
	}
	
	//根据id查询某一商品的详细信息
	public Goods getGoodsById(int gid){
		 Goods goods = iGoodsdao.getGoodsById(gid);
		 List<Discuss> allDiscussByGoods = iDiscussDao.getAllDiscussByGoods(goods,"所有");
		 Set<Discuss> set = new HashSet<Discuss>(allDiscussByGoods);
		 goods.setDiscusses(set);
		 return goods;
	}
	
	//查询商品表，按销量排序
	public List<Goods> getGoodsListOrderBySnum(){
		return iGoodsdao.getGoodsListOrderBySnum();
	}
	
	//查询商品表，按发布时间排序
	public List<Goods> getGoodsListOrderByPubTime(){
		return iGoodsdao.getGoodsListOrderByPubTime();
	}

	public void setiDiscussDao(IDiscussDao iDiscussDao) {
		this.iDiscussDao = iDiscussDao;
	}

	public void setiCategoryDao(ICategoryDao iCategoryDao) {
		this.iCategoryDao = iCategoryDao;
	}

}
