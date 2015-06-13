package com.jb.buz.Impl;

import java.util.List;

import com.jb.buz.IAddressBuz;
import com.jb.dao.IAddressDao;
import com.jb.dao.IOrderDao;
import com.jb.pojo.Address;
import com.jb.pojo.User;

public class IAddressBuzImpl implements IAddressBuz {

	private IAddressDao iAddressDao;
	private IOrderDao iOrderDao;
	//添加收货地址
	public boolean addAddress(Address address,User user){
		address.setUser(user);
		address.setFlag(0);
		return iAddressDao.addAddress(address);
	}
	
	//查询当前用户的所有收货地址
	public List<Address> getAddress(User u){
		return iAddressDao.getAddress(u);
	}
	
	//删除指定的收货地址
	public String delAddress(int aid){
		Address address = iAddressDao.getAddressById(aid);
		boolean b = iOrderDao.checkOrderAddress(address);
		if(b){
			return "error";
		}else{
			return iAddressDao.delAddress(aid);
		}
	}
	
	//设置默认的收货地址
	public String updateDefaultAddress(int aid, User u) {
		String str1 = iAddressDao.updateDefaultAddress(u);
		List<Address> list = getAddress(u);
		if(list.size()==1){
			return iAddressDao.setDefaultAddress(aid);
		}else if(list.size()>1){
			if(str1.equals("success")){
				String str2 = iAddressDao.setDefaultAddress(aid);
				if(str2.equals("success")){
					return "success";
				}
			}
		}
		return "error";
	}
	
	public void setiAddressDao(IAddressDao iAddressDao) {
		this.iAddressDao = iAddressDao;
	}

	public void setiOrderDao(IOrderDao iOrderDao) {
		this.iOrderDao = iOrderDao;
	}

	
}
