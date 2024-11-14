package com.example.demo.post.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString

@Builder
public class Post {
	private int postNo;
	private String postTitle;
	private String postContent;
	private int postCount;
	private Date postDate;
	private String postStatus;
	private String  memberNo;

	
}
