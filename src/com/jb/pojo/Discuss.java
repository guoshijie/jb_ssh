package com.jb.pojo;

import java.text.MessageFormat;

/**
 * Discuss entity. @author guo_shijie
 */

public class Discuss implements java.io.Serializable {

	private static final long serialVersionUID = -3117646037123029515L;
	private Integer id;
	private Goods goods;
	private User user;
	private String grade;
	private String details;
	private Items items;
	private String dtime;

	// Constructors

	/** default constructor */
	public Discuss() {
	}

	public Discuss(Integer id, Goods goods, User user, String grade,
			String details, Items items, String dtime) {
		super();
		this.id = id;
		this.goods = goods;
		this.user = user;
		this.grade = grade;
		this.details = details;
		this.items = items;
		this.dtime = dtime;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Goods getGoods() {
		return this.goods;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getGrade() {
		return this.grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getDetails() {
		return this.details;
	}

	public void setDetails(String details) {
		this.details = details;
	}

	public Items getItems() {
		return items;
	}

	public void setItems(Items items) {
		this.items = items;
	}
	
	@Override
	public String toString() {
		return MessageFormat.format("grade:{0}\tdetails{1}\titem:{2}", this.grade,this.details,this.items);
	}

	public String getDtime() {
		return dtime;
	}

	public void setDtime(String dtime) {
		this.dtime = dtime;
	}
	
	

}