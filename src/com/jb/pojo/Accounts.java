package com.jb.pojo;

/**
 * Accounts entity. @author MyEclipse Persistence Tools
 */

public class Accounts implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private User user;
	private Double curmoney;
	private Double account;
	private String payments;
	private String time;

	// Constructors

	/** default constructor */
	public Accounts() {
	}

	/** full constructor */
	public Accounts(User user, Double curmoney, Double account,
			String payments, String time) {
		this.user = user;
		this.curmoney = curmoney;
		this.account = account;
		this.payments = payments;
		this.time = time;
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

	public Double getCurmoney() {
		return this.curmoney;
	}

	public void setCurmoney(Double curmoney) {
		this.curmoney = curmoney;
	}

	public Double getAccount() {
		return this.account;
	}

	public void setAccount(Double account) {
		this.account = account;
	}

	public String getPayments() {
		return this.payments;
	}

	public void setPayments(String payments) {
		this.payments = payments;
	}

	public String getTime() {
		return this.time;
	}

	public void setTime(String time) {
		this.time = time;
	}

}