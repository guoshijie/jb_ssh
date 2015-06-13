package com.jb.pojo;

/**
 * News entity. @author MyEclipse Persistence Tools
 */

public class News implements java.io.Serializable {

	// Fields

	private static final long serialVersionUID = 2306032788750614912L;
	private Integer id;
	private User user;
	private String title;
	private String details;
	private String addTime;
	private String picture;
	private Integer status;	//1代表通告，2代表快报

	// Constructors

	/** default constructor */
	public News() {
	}

	/** full constructor */
	public News(User user, String title, String details, String addTime,
			String picture, Integer status) {
		this.user = user;
		this.title = title;
		this.details = details;
		this.addTime = addTime;
		this.picture = picture;
		this.status = status;
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

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDetails() {
		return this.details;
	}

	public void setDetails(String details) {
		this.details = details;
	}

	public String getAddTime() {
		return this.addTime;
	}

	public void setAddTime(String addTime) {
		this.addTime = addTime;
	}

	public String getPicture() {
		return this.picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

}