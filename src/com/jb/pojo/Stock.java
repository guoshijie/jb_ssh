package com.jb.pojo;

/**
 * Stock entity. @author MyEclipse Persistence Tools
 */

public class Stock implements java.io.Serializable {

	// Fields

	private Integer id;
	private Goods goods;
	private Integer snum;
	private Double sprice;
	private String sdate;

	// Constructors

	/** default constructor */
	public Stock() {
	}

	/** full constructor */
	public Stock(Goods goods, Integer snum, Double sprice, String sdate) {
		this.goods = goods;
		this.snum = snum;
		this.sprice = sprice;
		this.sdate = sdate;
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

	public Integer getSnum() {
		return this.snum;
	}

	public void setSnum(Integer snum) {
		this.snum = snum;
	}

	public Double getSprice() {
		return this.sprice;
	}

	public void setSprice(Double sprice) {
		this.sprice = sprice;
	}

	public String getSdate() {
		return this.sdate;
	}

	public void setSdate(String sdate) {
		this.sdate = sdate;
	}

}