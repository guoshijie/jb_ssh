package com.jb.buz;

import java.util.List;

import com.jb.pagination.Page;
import com.jb.pojo.User;

public interface IUserBuz {

	public String addUser(User user);
	public String login(User user);
	public boolean hasUser(String uname);
	public int getUserNum();
	public List<User> getPageList(Page page);
	public List<User> searchUserByName(String name);
	public boolean delUser(String[] aid);
	public User searchUserById(int id);
	public String modifyUser(User user);
	//给当前登录用户帐户充值
	public User modifyUserMoney(User user,Double money);
	public User searchPwdByName(String uname);
	//前台更新用户信息
	public User updateUser(User user,User preUser);
}
