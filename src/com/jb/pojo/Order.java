package com.jb.pojo;

import java.util.HashSet;
import java.util.Set;

/**
 * Order entity. @author MyEclipse Persistence Tools
 */

public class Order implements java.io.Serializable {

	private static final long serialVersionUID = -7608649120968626009L;
	private Integer oid;
	private Cart cart;
	private Address address;
	private User user;
	private String num;	//订单编号
	private String otime;	//下单时间
	private Double total;	//订单总价
	private Integer status=1;	//0:已删除   1：存在
	@SuppressWarnings("rawtypes")
	private Set itemses = new HashSet(0);

	// Constructors

	/** default constructor */
	public Order() {
	}

	/** minimal constructor */
	public Order(Cart cart) {
		this.cart = cart;
	}

	@SuppressWarnings("rawtypes")
	public Order(Integer oid, Cart cart, Address address, User user,
			String num, String otime, Double total, Set itemses) {
		super();
		this.oid = oid;
		this.cart = cart;
		this.address = address;
		this.user = user;
		this.num = num;
		this.otime = otime;
		this.total = total;
		this.itemses = itemses;
	}

	public Integer getOid() {
		return this.oid;
	}

	public void setOid(Integer oid) {
		this.oid = oid;
	}

	public Cart getCart() {
		return this.cart;
	}

	public void setCart(Cart cart) {
		this.cart = cart;
	}

	public Address getAddress() {
		return this.address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getNum() {
		return this.num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public Double getTotal() {
		return this.total;
	}

	public void setTotal(Double total) {
		this.total = total;
	}

	@SuppressWarnings("rawtypes")
	public Set getItemses() {
		return this.itemses;
	}

	@SuppressWarnings("rawtypes")
	public void setItemses(Set itemses) {
		this.itemses = itemses;
	}

	public String getOtime() {
		return otime;
	}

	public void setOtime(String otime) {
		this.otime = otime;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

}