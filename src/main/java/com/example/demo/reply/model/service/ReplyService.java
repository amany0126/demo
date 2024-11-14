package com.example.demo.reply.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.reply.model.mapper.ReplyMapper;
import com.example.demo.reply.vo.Reply;

@Service
public class ReplyService {

	@Autowired
	ReplyMapper replyMapper;
	
	public int insertReply(Reply r) {
		return replyMapper.insertReply(r);
		
	}

	public ArrayList<Reply> selectReply(int pno) {
		return replyMapper.selectReply(pno) ;
	}

	public int deleteReply(Reply r) {
		return replyMapper.deleteReply(r);
	}


	public int UpdateReply(Reply r) {
		return replyMapper.UpdateReply(r);
	}




}
