package com.example.demo.member.vo;

import java.sql.Date;

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

public class Member {
	private int memberNo;
	private String memberNickName;
	private String memberEmail;
	private String memberPwd;
	private String memberPhone;
	private String memberAddress;
	private String memberDetalAddress;
	private int memberAddressCode;
	private String memberAddressNote;
	private Date memberEnrollDate;
	private String memberStatus;
	
	
}
	