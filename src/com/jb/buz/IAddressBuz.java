package com.jb.buz;

import java.util.List;

import com.jb.pojo.Address;
import com.jb.pojo.User;

public interface IAddressBuz {

	//添加收货地址
	public boolean addAddress(Address address,User user);
	//查询当前用户的所有收货地址
	public List<Address> getAddress(User u);
	//删除指定的收货地址
	public String delAddress(int aid);
	//设置默认收货地址
	public String updateDefaultAddress(int aid,User u);
	
	
}
