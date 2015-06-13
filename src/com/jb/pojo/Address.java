package com.jb.pojo;

import java.text.MessageFormat;
import java.util.HashSet;
import java.util.Set;

public class Address implements java.io.Serializable {

	private static final long serialVersionUID = 3696468293565776881L;
	private Integer aid;
	private User user;
	private String receiver;
	private String tel;
	private String province;
	private String city;
	private String county;
	private String street;
	private Integer flag;
	private Set<?> orders = new HashSet<Object>(0);

	// Constructors

	/** default constructor */
	public Address() {
	}

	/** full constructor */
	public Address(User user, String receiver, String tel, String province,
			String city, String county, String street, Integer flag,Set<?> orders) {
		this.user = user;
		this.receiver = receiver;
		this.tel = tel;
		this.province = province;
		this.city = city;
		this.county = county;
		this.street = street;
		this.flag = flag;
		this.orders = orders;
	}

	public Integer getAid() {
		return this.aid;
	}

	public void setAid(Integer aid) {
		this.aid = aid;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getReceiver() {
		return this.receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getTel() {
		return this.tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getProvince() {
		return this.province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCity() {
		return this.city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCounty() {
		return this.county;
	}

	public void setCounty(String county) {
		this.county = county;
	}

	public String getStreet() {
		return this.street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public Set<?> getOrders() {
		return this.orders;
	}

	public void setOrders(Set<?> orders) {
		this.orders = orders;
	}
	
	public Integer getFlag() {
		return flag;
	}
	
	public void setFlag(Integer flag) {
		this.flag = flag;
	}
	
	@Override
	public String toString() {
		return MessageFormat.format("User:{0}\n收货人:{1}\n手机号:{2}\n省:{3}\n市:{4}\n县:{5}\n街道:{6}\n是否默认:{7}", this.user,this.receiver,this.tel,this.province,this.city,this.county,this.street,this.flag);
	}


}