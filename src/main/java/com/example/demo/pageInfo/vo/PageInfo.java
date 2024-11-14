package com.example.demo.pageInfo.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class PageInfo {

	private int listCount; // 글 갯수
	private int currentPage; // 현재 페이지
	private int pageLimit; // 한번에 보여질 페이지수
	private int postLimit; // 한번에 보여질 글 갯수
	
	private int maxPage; // 최대 페이지
	private int startPage; // 시작페이지
	private int endPage; // 끝 페이
}
