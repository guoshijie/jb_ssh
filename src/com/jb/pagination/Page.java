package com.jb.pagination;

import java.text.MessageFormat;
import java.util.List;

/**
 * 分页所用到的基本属性
 * 
 * @author guo_shijie
 * 
 */
public class Page {

	private int pageAllSize; // 总共的记录条数
	private int pageSize; // 每页显示的记录条数
	private int pageNow; // 当前页数
	private int pageCount; // 总页数
	private int beginNum; // 每页开始的序号
	private boolean hasPre; // 是否有前一页
	private boolean hasNext; // 是否有下一页
	private List<?> list;		//每页显示的集合

	
	public Page() {
		super();
	}

	public int getPageAllSize() {
		return pageAllSize;
	}

	public void setPageAllSize(int pageAllSize) {
		this.pageAllSize = pageAllSize;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPageNow() {
		return pageNow;
	}

	public void setPageNow(int pageNow) {
		this.pageNow = pageNow;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public int getBeginNum() {
		return beginNum;
	}

	public void setBeginNum(int beginNum) {
		this.beginNum = beginNum;
	}

	public boolean isHasPre() {
		return hasPre;
	}

	public void setHasPre(boolean hasPre) {
		this.hasPre = hasPre;
	}

	public boolean isHasNext() {
		return hasNext;
	}

	public void setHasNext(boolean hasNext) {
		this.hasNext = hasNext;
	}

	public List<?> getList() {
		return list;
	}

	public void setList(List<?> list) {
		this.list = list;
	}
	
	@Override
	public String toString() {
		return MessageFormat.format("beginNum:{0}\npageSize:{1}\npageAllSize:{2}\npageCount:{3}\npageNow:{4}", this.beginNum,this.pageSize,this.pageAllSize,this.pageCount,this.pageNow);
	}

}
