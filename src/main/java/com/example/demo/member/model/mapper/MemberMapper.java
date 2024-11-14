package com.example.demo.member.model.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.member.vo.Member;

@Mapper
public interface MemberMapper {
	
	int nickNameCheck(String nickNameCheck);

	int memberEmailCheck(String memberEmailCheck);
	
	int memberInsert(Member m);

	Member loginMember(Member m);

}
