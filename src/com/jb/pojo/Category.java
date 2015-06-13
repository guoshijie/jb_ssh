package com.jb.pojo;

import java.text.MessageFormat;
import java.util.HashSet;
import java.util.Set;

/**
 * Category entity. @author MyEclipse Persistence Tools
 */

public class Category implements java.io.Serializable {

	private static final long serialVersionUID = -6004445528488558037L;
	private Integer id;
	private Category category;
	private String name;
	private Integer level;
	private Set categories = new HashSet(0);
	private Set goodses = new HashSet(0);

	// Constructors

	/** default constructor */
	public Category() {
	}

	/** full constructor */
	public Category(Category category, String name, Integer level,
			Set categories, Set goodses) {
		this.category = category;
		this.name = name;
		this.level = level;
		this.categories = categories;
		this.goodses = goodses;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Category getCategory() {
		return this.category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getLevel() {
		return this.level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public Set getCategories() {
		return this.categories;
	}

	public void setCategories(Set categories) {
		this.categories = categories;
	}

	public Set getGoodses() {
		return this.goodses;
	}

	public void setGoodses(Set goodses) {
		this.goodses = goodses;
	}

	@Override
	public String toString() {
		return MessageFormat.format("name:{0}\tlevel:{1}", this.name,this.level);
	}
}