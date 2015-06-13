package com.jb.buz.Impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.jb.buz.IUserBuz;
import com.jb.dao.ILevelDao;
import com.jb.dao.IUserDao;
import com.jb.pagination.Page;
import com.jb.pojo.Level;
import com.jb.pojo.User;

public class IUserBuzImpl implements IUserBuz {

	private IUserDao iUserDao;
	private ILevelDao iLevelDao;
	
	public User searchPwdByName(String uname){
		return iUserDao.searchPwdByName(uname);
	}
	
	//前台更新用户信息
	public User updateUser(User user,User preUser){
		user.setUid(preUser.getUid());
		user.setAccountses(preUser.getAccountses());
		user.setAddresses(preUser.getAddresses());
		user.setAdmin(preUser.getAdmin());
		user.setService(preUser.getService());
		user.setMoney(preUser.getMoney());
		user.setRegTime(preUser.getRegTime());
		user.setLevel(preUser.getLevel());
		if(iUserDao.updateUser(user).equals("success")){
			return user;
		}
		return null;
	}

	public String addUser(User user){
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = format.format(new Date());
		
		user.setRegTime(date);
		
		Level level = iLevelDao.getLevel(1);
		user.setLevel(level);
		
		return iUserDao.addUser(user);
	}
	
	public String login(User user){
		User dbuser = iUserDao.searchPwdByName(user.getUname());
		
		if(null != dbuser){
			if(dbuser.getPwd().equals(user.getPwd())){
				return "success";
			}else{
				return "error";
			}
		}
		return "error";
	}
	
	public boolean hasUser(String uname){
		return iUserDao.hasUser(uname);
	}
	
	public int getUserNum(){
		return iUserDao.getUserNum();
	}
	
	public List<User> getPageList(Page page){
		return iUserDao.getPageList(page);
	}
	
	public List<User> searchUserByName(String name){
		List<User> list = iUserDao.searchUserByName(name);
		return list;
	}
	
	public boolean delUser(String[] aid){
		int n = iUserDao.delUser(aid);
		if(n!=0){
			return true;
		}else{
			return false;
		}
	}
	
	//给当前登录用户帐户充值
	public User modifyUserMoney(User user,Double money){
		return iUserDao.recharge(user, money);
	}
	
	public User searchUserById(int id){
		return iUserDao.searchUserById(id);
	}
	
	public String modifyUser(User user){
		User u = iUserDao.searchUserById(user.getUid());
		u.setUname(user.getUname());
		u.setPwd(user.getPwd());
		u.setPhone(user.getPhone());
		u.setService(user.getService());
		u.setAdmin(user.getAdmin());
		u.setRegIp(user.getRegIp());
		u.setEmail(user.getEmail());
		return iUserDao.modifyUser(u);
	}

	public void setiUserDao(IUserDao iUserDao) {
		this.iUserDao = iUserDao;
	}

	public void setiLevelDao(ILevelDao iLevelDao) {
		this.iLevelDao = iLevelDao;
	}

	

}
