package com.jb.dao;

import java.util.List;

import com.jb.pojo.Address;
import com.jb.pojo.User;

public interface IAddressDao {

	//添加收货地址
	public boolean addAddress(Address address);
	//查询当前用户的所有收货地址
	public List<Address> getAddress(User u);
	//删除指定的收货地址
	public String delAddress(int aid);
	//查找当前登录用户的默认地址
	public String updateDefaultAddress(User u);
	//设置默认地址
	public String setDefaultAddress(int aid);
	//根据id查询地址
	public Address getAddressById(Integer aid);
}
