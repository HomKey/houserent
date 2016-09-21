package com.hk.base.support;


public class Pages {
    // 当前页
    private int currentPage;
    // 每页个个数
    private int pageSize;
    // 总条数
    private int totalCount;
    
    public Pages(int pageSize, int currentPage) {
		this.pageSize = pageSize;
		this.currentPage = currentPage;
	}
    public int getTotalPages() {
		if (totalCount <= 0 || pageSize <= 0) {
			return 0;
		}
		return (totalCount - 1) / pageSize + 1;
	}
	public int getCurrentRow() {
		if (currentPage <= 0) {
			return 0;
		}
		return pageSize * (currentPage - 1);
	}
    public int getCurrentPage() {
        return currentPage;
    }
 
    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }
 
    public int getPageSize() {
        return pageSize;
    }
 
    public void setPageSize(int pageSize) {
        this.pageSize = pageSize <= 0 ? 10 : pageSize;
    }
 
    public int getTotalCount() {
        return totalCount;
    }
 
    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }
}
