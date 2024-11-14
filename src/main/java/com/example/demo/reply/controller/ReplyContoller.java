package com.example.demo.reply.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.member.vo.Member;
import com.example.demo.reply.model.service.ReplyService;
import com.example.demo.reply.vo.Reply;



@Controller
public class ReplyContoller {

	@Autowired
	ReplyService replyService;
	
	
	
	@ResponseBody
	@PostMapping(value = "insertReply.re", produces = "text/html; charset=UTF-8")
	public String insertPost(Reply r, HttpSession session) {
		 
		 int memberNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		 
		 r.setMemberNo(""+ memberNo); 
		 
    	int result =  replyService.insertReply(r);
		 
    	return (result >0)? "NNNY":"NNNN";
	}
	
	@ResponseBody
	@PostMapping(value = "selectReply.re")
	public ArrayList<Reply> selectReply(int pno) {
		
		ArrayList<Reply> list =  replyService.selectReply(pno);
		 
		for (int i = 0; i < list.size(); i++) {
				list.get(i).setReplyContent(list.get(i).getReplyContent().replace("\r\n", "<br>"));
				list.get(i).setReplyContent(list.get(i).getReplyContent().replace("\n", "<br>"));
				list.get(i).setReplyContent(list.get(i).getReplyContent().replace(" ", "&nbsp"));
		}
		
		 return list;
	}
	
	@ResponseBody
	@PostMapping(value = "/deleteReply.re")
	public String deletePost(Reply r,HttpSession session){
		
		
		int memberNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		 
		 r.setMemberNo(""+ memberNo); 
		int Result = replyService.deleteReply(r);
		
		return (Result >0)? "NNNY":"NNNN";
	}
	@ResponseBody
	@PostMapping(value = "/UpdateReply.re")
	public String UpdateReply(Reply r,HttpSession session){
		
		int memberNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		 
		 r.setMemberNo(""+ memberNo); 
		int Result = replyService.UpdateReply(r);
		
		return (Result >0)? "NNNY":"NNNN";
	}
}
