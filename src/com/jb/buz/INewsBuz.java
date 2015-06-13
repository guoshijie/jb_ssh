package com.jb.buz;

import java.util.List;

import com.jb.pagination.Page;
import com.jb.pojo.News;
import com.jb.pojo.User;

public interface INewsBuz {

	//添加news
	public void addNews(News news,User u);
	//查询首页显示的通告list
	public List<News> getListShowIndex();
	//查询所有的通告
	public List<News> getAllNews();
	//删除某一通告
	public void delNews(Integer id);
	//修改通告内容
	public void updateNews(News news,User u);
	//根据id查询通告
	public News getNewsById(Integer id);
	//后台分页显示通告
	public List<News> getNewsByPage(Page page);
	//后台批量删除通告
	public boolean delNewsPatch(String[] nid);
}
