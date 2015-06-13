package com.jb.buz.Impl;

import java.util.List;

import com.jb.buz.ICategoryBuz;
import com.jb.dao.ICategoryDao;
import com.jb.pojo.Category;

public class ICategoryBuzImpl implements ICategoryBuz{
	
	private ICategoryDao iCategoryDao;
	
	//根据level查询某一级别的所有类型
	public List<Category> getCategoryListByLevel(Integer level){
		return iCategoryDao.getCategoryListByLevel(level);
	}
	
	//模糊匹配name返回List<Category>
	public List<Category> getCategoryListFuzzyMatchingCname(String str){
		return iCategoryDao.getCategoryListFuzzyMatchingCname(str);
	}
	
	public String addType(Category category,int id){
		Category c = iCategoryDao.getCategory(id);
		category.setCategory(c);
		category.setLevel(c.getLevel()+1);
		return iCategoryDao.addType(category);
	}
	
	public String addType(Category category){
		category.setLevel(1);
		return iCategoryDao.addType(category);
	}
	
	public Category getCategory(int id){
		return iCategoryDao.getCategory(id);
	}
	
	//获取所有一级类别
	public List<Category> getAllRootCategory(){
		return iCategoryDao.getAllRootCategory();
	}
	
	public List<Category> getType(){
		return iCategoryDao.getType();
	}
	public List<Category> getTypeById(int id){
		return iCategoryDao.getTypeById(id);
	}
	public List<Category> getTypeInfo(){
		return iCategoryDao.getTypeInfo();
	}
	
	public void setiCategoryDao(ICategoryDao iCategoryDao) {
		this.iCategoryDao = iCategoryDao;
	}
	
}
