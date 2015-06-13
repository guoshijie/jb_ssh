package com.jb.pojo;

import java.util.HashSet;
import java.util.Set;

/**
 * Cart entity. @author MyEclipse Persistence Tools
 */

public class Cart implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6093041798352120992L;
	private Integer id;
	private User user;
	private Double money;
	private Integer status;
	private Integer gid;
	private Order order;
	@SuppressWarnings("rawtypes")
	private Set itemses = new HashSet(0);
	
	// Constructors

	/** default constructor */
	public Cart() {
	}

	/** full constructor */
	public Cart(User user, Double money, Integer status, Integer gid, Order order) {
		this.user = user;
		this.money = money;
		this.status = status;
		this.gid = gid;
		this.order = order;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Double getMoney() {
		return this.money;
	}

	public void setMoney(Double money) {
		this.money = money;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getGid() {
		return this.gid;
	}

	public void setGid(Integer gid) {
		this.gid = gid;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	@SuppressWarnings("rawtypes")
	public Set getItemses() {
		return itemses;
	}

	@SuppressWarnings("rawtypes")
	public void setItemses(Set itemses) {
		this.itemses = itemses;
	}

}