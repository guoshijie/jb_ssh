package com.jb.dao;

import java.util.List;

import com.jb.pojo.Category;

public interface ICategoryDao {

	public String addType(Category category);
	
	public Category getCategory(int id);
	//简单查询所有类型
	public List<Category> getType();
	//详细查询所有类型（经过处理，形成树形结构）
	public List<Category> getTypeInfo();
	public List<Category> getTypeById(int id);
	//获取所有一级类别
	public List<Category> getAllRootCategory();
	//根据level查询某一级别的所有类型
	public List<Category> getCategoryListByLevel(Integer level);
	//获取某一类型的所有子类别
	public List<Category> getChildList(Category category);
	//根据name查询category
	public Category getCategoryByName(String name);
	//模糊匹配name返回List<Category>
	public List<Category> getCategoryListFuzzyMatchingCname(String str);
	//获取某一类型集合的所有子类别，返回集合
	public List<Category> getChildListByCollection(List<Category> categoryList);
	
}