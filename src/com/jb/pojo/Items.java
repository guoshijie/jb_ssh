package com.jb.pojo;

import java.text.MessageFormat;

/**
 * Items entity. @author guo_shijie
 */
public class Items implements java.io.Serializable {

	private static final long serialVersionUID = -5817843385018745974L;
	private Integer id;
	private Goods goods;	//商品
	private Order order;
	private Integer num;	//商品数量
	private Double amount;	//本条目总额
	private Cart cart;	//属于哪个购物车的
	private Discuss discuss;

	/** default constructor */
	public Items() {
	}

	public Items(Goods goods, Integer num) {
		this.goods = goods;
		this.num = num;
	}

	public Items(Integer id, Goods goods, Order order, Integer num,
			Double amount, Cart cart, Discuss discuss) {
		this.id = id;
		this.goods = goods;
		this.order = order;
		this.num = num;
		this.amount = amount;
		this.cart = cart;
		this.discuss = discuss;
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

	public Order getOrder() {
		return this.order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public Integer getNum() {
		return this.num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

	public Double getAmount() {
		return this.amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}
	
	@Override
	public String toString() {
		return MessageFormat.format("gid:{0}\tnum:{1}", this.goods.getGid(),this.num);
	}

	public Cart getCart() {
		return cart;
	}

	public void setCart(Cart cart) {
		this.cart = cart;
	}

	public Discuss getDiscuss() {
		return discuss;
	}

	public void setDiscuss(Discuss discuss) {
		this.discuss = discuss;
	}

}