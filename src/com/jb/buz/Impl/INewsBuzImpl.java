package com.jb.buz.Impl;

import java.util.List;

import com.jb.buz.INewsBuz;
import com.jb.dao.INewsDao;
import com.jb.pagination.Page;
import com.jb.pojo.News;
import com.jb.pojo.User;
import com.jb.utils.DateUtils;

public class INewsBuzImpl implements INewsBuz {

	private INewsDao iNewsDao;
	
	//后台批量删除通告
	public boolean delNewsPatch(String[] nid){
		int delNewsPatch = iNewsDao.delNewsPatch(nid);
		if(delNewsPatch!=0){
			return true;
		}else{
			return false;
		}
	}
	
	//查询首页显示的通告list
	public List<News> getListShowIndex(){
		return iNewsDao.getListShowIndex();
	}
	
	//根据id查询通告
	public News getNewsById(Integer id){
		return iNewsDao.getNewsById(id);
	}
	
	//删除某一通告
	public void delNews(Integer id){
		iNewsDao.delNews(id);
	}
	
	//添加首页通告
	public void addNews(News news,User u){
		String date = DateUtils.getNowTime();
		news.setAddTime(date);
		news.setUser(u);
		news.setStatus(1);//1代表通告，2代表快报
		iNewsDao.addNews(news);
	}
	
	//查询所有的通告
	public List<News> getAllNews(){
		return iNewsDao.getAllNews();
	}
	
	//后台分页显示通告
	public List<News> getNewsByPage(Page page){
		return iNewsDao.getNewsByPage(page);
	}

	//修改通告内容
	public void updateNews(News news,User u){
		String date = DateUtils.getNowTime();
		news.setAddTime(date);
		news.setUser(u);
		news.setStatus(1);//1代表通告，2代表快报
		iNewsDao.updateNews(news);
	}

	public void setiNewsDao(INewsDao iNewsDao) {
		this.iNewsDao = iNewsDao;
	}
}
