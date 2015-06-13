package com.jb.pagination;

public class PageUtils {

	private static int pageCount = 0;
	private static int beginNum = 0;
	private static boolean hasPre;
	private static boolean hasNext;
	private Page page;

	public Page createPage(int pageAllSize, int pageSize, int pageNow) {

		page.setPageAllSize(pageAllSize);
		page.setPageSize(getPageSize(pageSize));

		pageCount = getPageCount(pageAllSize, pageSize);
		page.setPageCount(pageCount);
		
		page.setPageNow(getPageNow(pageNow,pageCount));

		beginNum = getBeginNum(pageSize, page.getPageNow());
		page.setBeginNum(beginNum);

		hasPre = getHasPre(pageNow);
		page.setHasPre(hasPre);

		hasNext = getHasNext(pageNow,pageCount);
		page.setHasNext(hasNext);

		return page;
	}

	public static int getPageCount(int pageAllSize, int pageSize) {
		return pageAllSize % pageSize == 0 ? pageAllSize / pageSize	: pageAllSize / pageSize + 1;
	}

	public static int getBeginNum(int pageSize, int pageNow) {
		return (pageNow - 1) * pageSize;
	}

	public static boolean getHasPre(int pageNow) {
		return pageNow == 1 ? false : true;
	}
	
	public static boolean getHasNext(int pageNow,int pageCount){
		return pageNow == pageCount? false:true;
	}
	
	public static int getPageSize(int pageSize){
		return pageSize < 1 ? 2 : pageSize;
	}
	
	public static int getPageNow(int pageNow,int pageCount){
		if(pageNow < 1){
			return 1;
		}
		if(pageNow > pageCount){
			return pageCount;
		}
		return pageNow;
	}

	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}

}
