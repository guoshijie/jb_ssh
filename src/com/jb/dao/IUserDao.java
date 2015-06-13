package com.jb.dao;

import java.util.List;

import com.jb.pagination.Page;
import com.jb.pojo.User;

public interface IUserDao {

	public String addUser(User user);
	public User searchPwdByName(String uname);
	public Boolean hasUser(String uname);
	public int getUserNum();
	public List<User> getPageList(Page page);
	public List<User> searchUserByName(String name);
	public int delUser(String[] k);
	public User searchUserById(int id);
	public String modifyUser(User user);
	//给当前登录用户帐户充值
	public User recharge(User user,Double money);
	//前台更新用户信息
	public String updateUser(User user);
	//下单后更新user帐户余额
	public boolean updateUserMoney(Double sumMoney,User user);
}
