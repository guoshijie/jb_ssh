package com.jb.pojo;

import java.text.MessageFormat;
import java.util.HashSet;
import java.util.Set;

/**
 * Goods entity. @author guo_shijie
 */

public class Goods implements java.io.Serializable {

	// Fields
	private static final long serialVersionUID = -3514308007604653037L;
	private Integer gid;
	private Category category;	//商品类型
	private String gname;	//商品名称
	private Double sprice;	//售价
	private Double dprice;	//折扣价
	private Integer gnum;	//当前库存
	private Integer snum = 0;	//已售数量
	private String modifyTime;
	private String img;
	private String groupBuy;	//是否团购
	private String noPostage;	//是否包邮
	private String area;			//所在地区
	private Integer status = 1;		//0表示下架，1表示上架
	private Integer score;
	private Set attributes = new HashSet(0);
	private Set discusses = new HashSet(0);
	private Set stocks = new HashSet(0);
	private Set itemses = new HashSet(0);
	private Set groupbuies = new HashSet(0);
	// Constructors

	/** default constructor */
	public Goods() {
	}

	/** full constructor */
	public Goods(Category category, String gname, Double sprice, Double dprice,
			Integer gnum, Integer snum, String modifyTime, String img,
			String groupBuy, Integer status, Integer score, Set attributes,
			Set discusses, Set stocks, Set itemses, Set groupbuies) {
		this.category = category;
		this.gname = gname;
		this.sprice = sprice;
		this.dprice = dprice;
		this.gnum = gnum;
		this.snum = snum;
		this.modifyTime = modifyTime;
		this.img = img;
		this.groupBuy = groupBuy;
		this.status = status;
		this.score = score;
		this.attributes = attributes;
		this.discusses = discusses;
		this.stocks = stocks;
		this.itemses = itemses;
		this.groupbuies = groupbuies;
	}

	// Property accessors

	public Integer getGid() {
		return this.gid;
	}

	public void setGid(Integer gid) {
		this.gid = gid;
	}

	public Category getCategory() {
		return this.category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public String getGname() {
		return this.gname;
	}

	public void setGname(String gname) {
		this.gname = gname;
	}

	public Double getSprice() {
		return this.sprice;
	}

	public void setSprice(Double sprice) {
		this.sprice = sprice;
	}

	public Double getDprice() {
		return this.dprice;
	}

	public void setDprice(Double dprice) {
		this.dprice = dprice;
	}

	public Integer getGnum() {
		return this.gnum;
	}

	public void setGnum(Integer gnum) {
		this.gnum = gnum;
	}

	public Integer getSnum() {
		return this.snum;
	}

	public void setSnum(Integer snum) {
		this.snum = snum;
	}

	public String getModifyTime() {
		return this.modifyTime;
	}

	public void setModifyTime(String modifyTime) {
		this.modifyTime = modifyTime;
	}

	public String getImg() {
		return this.img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getGroupBuy() {
		return this.groupBuy;
	}

	public void setGroupBuy(String groupBuy) {
		this.groupBuy = groupBuy;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getScore() {
		return this.score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	public Set getAttributes() {
		return this.attributes;
	}

	public void setAttributes(Set attributes) {
		this.attributes = attributes;
	}

	public Set getDiscusses() {
		return this.discusses;
	}

	public void setDiscusses(Set discusses) {
		this.discusses = discusses;
	}

	public Set getStocks() {
		return this.stocks;
	}

	public void setStocks(Set stocks) {
		this.stocks = stocks;
	}

	public Set getItemses() {
		return this.itemses;
	}

	public void setItemses(Set itemses) {
		this.itemses = itemses;
	}

	public Set getGroupbuies() {
		return this.groupbuies;
	}

	public void setGroupbuies(Set groupbuies) {
		this.groupbuies = groupbuies;
	}
	
	public void setNoPostage(String noPostage) {
		this.noPostage = noPostage;
	}
	
	public String getNoPostage() {
		return this.noPostage;
	}
	
	public String getArea() {
		return area;
	}
	
	public void setArea(String area) {
		this.area = area;
	}
	
	@Override
	public String toString() {
		return MessageFormat.format("商品ID：{0}\n商品名称：{1}\n售价：{2}\n库存：{3}\n地区：{4}\n评论数：{5}", this.gid,this.gname,this.sprice,this.gnum,this.area,this.getDiscusses().size());
	}



}