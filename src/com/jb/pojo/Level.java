package com.jb.pojo;

import java.util.HashSet;
import java.util.Set;

/**
 * Level entity. @author MyEclipse Persistence Tools
 */

public class Level implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer level;
	private Integer integral;
	private Double discount;
	private Set users = new HashSet(0);

	// Constructors

	/** default constructor */
	public Level() {
	}

	/** full constructor */
	public Level(Integer level, Integer integral, Double discount, Set users) {
		this.level = level;
		this.integral = integral;
		this.discount = discount;
		this.users = users;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getLevel() {
		return this.level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public Integer getIntegral() {
		return this.integral;
	}

	public void setIntegral(Integer integral) {
		this.integral = integral;
	}

	public Double getDiscount() {
		return this.discount;
	}

	public void setDiscount(Double discount) {
		this.discount = discount;
	}

	public Set getUsers() {
		return this.users;
	}

	public void setUsers(Set users) {
		this.users = users;
	}

}