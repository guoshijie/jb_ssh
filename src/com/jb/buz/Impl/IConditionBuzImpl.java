package com.jb.buz.Impl;

import java.util.ArrayList;
import java.util.List;

import com.jb.buz.IConditionBuz;
import com.jb.pagination.Page;
import com.jb.pojo.Goods;

public class IConditionBuzImpl implements IConditionBuz {

	//得到多条件查询当前页所显示的list
	public List<Goods> getPageMultiConditionGoodsList(Page page,List<Goods> list){
		List<Goods> newList = new ArrayList<Goods>();
		
		int end = page.getPageSize()*page.getPageNow();
		if(end>page.getPageAllSize()){
			end = page.getPageAllSize();
		}
		for(int i=page.getBeginNum();i<end;i++){
			newList.add(list.get(i));
		}
		return newList;
	}
	
}
