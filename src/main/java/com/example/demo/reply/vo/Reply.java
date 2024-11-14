package com.example.demo.reply.vo;

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
public class Reply {

	private int replyNo;
	private String replyContent;
	private String replyEnrollDate;
	private String replyStatus;
	private int parentNo;
	private int replyLevel;
	private int postNo;
	private String  memberNo;

}

