package com.example.demo.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.example.demo.member.model.mapper.MemberMapper;
import com.example.demo.member.vo.Member;

@Service
public class MemberService {
	/* @Autowired */
	/* private sqlSessipnTemplate sqlSession; */

	
	  @Autowired 
	  private MemberMapper memberMapper;
	 
	 public int nickNameCheck(String nickNameCheck) { 
	 return  memberMapper.nickNameCheck(nickNameCheck);
	 }

	 public int memberEmailCheck(String memberEmailCheck) {
		 return memberMapper.memberEmailCheck(memberEmailCheck);
	 }

	 public int memberInsert(Member m) {
		return  memberMapper.memberInsert(m);
	}

	public Member loginMember(Member m) {
		return memberMapper.loginMember(m);
	}

	 
}
