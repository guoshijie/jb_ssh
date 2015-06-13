package com.jb.pojo;

/**
 * Groupbuy entity. @author MyEclipse Persistence Tools
 */

public class Groupbuy implements java.io.Serializable {

	// Fields

	private Integer id;
	private Goods goods;
	private String beginTime;
	private String endTime;
	private Integer maxNum;
	private Integer curNum;
	private Double gprice;

	// Constructors

	/** default constructor */
	public Groupbuy() {
	}

	/** full constructor */
	public Groupbuy(Goods goods, String beginTime, String endTime,
			Integer maxNum, Integer curNum, Double gprice) {
		this.goods = goods;
		this.beginTime = beginTime;
		this.endTime = endTime;
		this.maxNum = maxNum;
		this.curNum = curNum;
		this.gprice = gprice;
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

	public String getBeginTime() {
		return this.beginTime;
	}

	public void setBeginTime(String beginTime) {
		this.beginTime = beginTime;
	}

	public String getEndTime() {
		return this.endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public Integer getMaxNum() {
		return this.maxNum;
	}

	public void setMaxNum(Integer maxNum) {
		this.maxNum = maxNum;
	}

	public Integer getCurNum() {
		return this.curNum;
	}

	public void setCurNum(Integer curNum) {
		this.curNum = curNum;
	}

	public Double getGprice() {
		return this.gprice;
	}

	public void setGprice(Double gprice) {
		this.gprice = gprice;
	}

}