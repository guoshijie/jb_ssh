package com.jb.pojo;

/**
 * Attribute entity. @author MyEclipse Persistence Tools
 */

public class Attribute implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = -8540406961053538989L;
	private Integer id;
	private Goods goods;
	private Integer pnumber;
	private String pname;
	private String pvalue;

	// Constructors

	/** default constructor */
	public Attribute() {
	}

	/** full constructor */
	public Attribute(Goods goods, Integer pnumber, String pname, String pvalue) {
		this.goods = goods;
		this.pnumber = pnumber;
		this.pname = pname;
		this.pvalue = pvalue;
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

	public Integer getPnumber() {
		return this.pnumber;
	}

	public void setPnumber(Integer pnumber) {
		this.pnumber = pnumber;
	}

	public String getPname() {
		return this.pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getPvalue() {
		return this.pvalue;
	}

	public void setPvalue(String pvalue) {
		this.pvalue = pvalue;
	}

}