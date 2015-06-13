package com.jb.pojo;

import java.text.MessageFormat;

public class Collect implements java.io.Serializable {

	//我的收藏
	private static final long serialVersionUID = 5233652740492793360L;
	private Integer cid;
	private Goods goods;
	private User user;
	private String ctime;

	public Collect() {
	}

	public Collect(Goods goods, User user, String ctime) {
		this.goods = goods;
		this.user = user;
		this.ctime = ctime;
	}

	public Integer getCid() {
		return this.cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
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

	public String getCtime() {
		return this.ctime;
	}

	public void setCtime(String ctime) {
		this.ctime = ctime;
	}
	
	public String toString() {
		return MessageFormat.format("id:{0}\tuser:{1}\tgoods:{2}\tctime:{3}\t", this.cid,this.user,this.goods,this.ctime);
	};

}