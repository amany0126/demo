package com.example.demo.pageInfo.template;

import com.example.demo.pageInfo.vo.PageInfo;

public class Pagination {
	
	public static PageInfo getPageInfo(int listCount,
			   int currentPage,
			   int pageLimit,
			   int postdLimit) {

	int maxPage = (int)Math.ceil((double)listCount / postdLimit);
	int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
	int endPage = startPage + pageLimit - 1;
	
	if(endPage > maxPage) {
	endPage = maxPage;
	}
	
	PageInfo pi = new PageInfo(listCount, currentPage, 
			   pageLimit, postdLimit,
			   maxPage, startPage, endPage);
	
	return pi;
	}

}
