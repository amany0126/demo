package com.example.demo.reply.model.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.reply.vo.Reply;

@Mapper
public interface ReplyMapper {

	int insertReply(Reply r);

	ArrayList<Reply> selectReply(int pno);

	int deleteReply(Reply r);

	int UpdateReply(Reply r);


		

}
