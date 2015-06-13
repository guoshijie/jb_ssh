package com.jb.buz;

import java.util.List;

import com.jb.pagination.Page;
import com.jb.pojo.Goods;

public interface IConditionBuz {

	//得到多条件查询当前页所显示的list
	public List<Goods> getPageMultiConditionGoodsList(Page page,List<Goods> list);
	
}
