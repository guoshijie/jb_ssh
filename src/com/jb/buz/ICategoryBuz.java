package com.jb.buz;

import java.util.List;

import com.jb.pojo.Category;

public interface ICategoryBuz {
	//查询所有的商品类型
	public List<Category> getType();
	//添加商品类型
	public String addType(Category category,int id);
	public String addType(Category category);
	//根据id查找商品类型
	public Category getCategory(int id);
	public List<Category> getTypeInfo();
	public List<Category> getTypeById(int id);
	//获取所有一级类别
	public List<Category> getAllRootCategory();
	//根据level查询某一级别的所有类型
	public List<Category> getCategoryListByLevel(Integer level);
	//模糊匹配name返回List<Category>
	public List<Category> getCategoryListFuzzyMatchingCname(String str);
	
}
