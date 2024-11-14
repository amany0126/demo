package com.example.demo.member.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.member.model.service.MemberService;
import com.example.demo.member.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MemberController {
	
	@Autowired private BCryptPasswordEncoder bcryptPasswordEncoder;
	@Autowired private MemberService memberService;
	
	
	@GetMapping(value = "membership.me")
	public String membership() {
		return "member/membership";
	}
	
	// 닉네임 중복검사
	@ResponseBody
	@PostMapping(value = "nickNameCheck.me", produces = "text/html; charset=UTF-8" )
	public String nickNameCheck(String nickNameCheck) {
		
		int count = memberService.nickNameCheck(nickNameCheck);
		
		return (count>0)? "NNNN":"NNNY";
	} 
	// 이메일 중복검사
	@ResponseBody
	@PostMapping(value = "memberEmailCheck.me", produces = "text/html; charset=UTF-8" )
	public String memberEmailCheck(String memberEmailCheck) {
			int count = memberService.memberEmailCheck(memberEmailCheck);
		
		return (count>0)? "NNNN":"NNNY";
	}
	// 회원가입
	@ResponseBody
	@PostMapping(value = "insert.me", produces = "text/html; charset=UTF-8" )
	public String memberInsert(Member m ) {
		
		// 가입시 입력된 비밀번호 암호화
		String encPwd = bcryptPasswordEncoder.encode(m.getMemberPwd());
		// 암호회된 비밀번호 갱신
		m.setMemberPwd(encPwd);
		
		int count = memberService.memberInsert(m);
		return (count>0)? "NNNY":"NNNN";

	}	
	@GetMapping(value = "loginPage.me")
	public String loginPage(){
		return "member/login";
		
	}
	@ResponseBody
	@PostMapping(value = "login.me", produces = "text/html; charset=UTF-8")
	public String loginMember(Member m, String saveEmail, HttpServletResponse response, HttpSession session) {
		// 1. 이메일 저장 선택 여부 확인
		if (saveEmail != null && saveEmail.equals("y")) {
			Cookie cookie = new Cookie("saveEmail", m.getMemberEmail()); // 쿠키의 saveId에  email 정보 기입 
			cookie.setMaxAge( 7 * 24 * 60 * 60); // 쿠키의 유효기간을  1일을 초로 변환하여 지정
			response.addCookie(cookie); // 정보 업데이트
		}else {
			Cookie cookie = new Cookie("saveEmail", m.getMemberEmail()); // 쿠키의 saveId에  email 정보 기입 
			cookie.setMaxAge(0); // 쿠키의 유효기간을  0초로 지정
			response.addCookie(cookie); // 정보 업데이트
		}
		// 로그인을 시도하는 이메일의 정보 가져오기
		Member loginUser = memberService.loginMember(m);
		String result;
		// 가저온 정보와 비밀번호 일치여부 
		// 다만 DB 상에서는 암호화가 되어있기떄문에 matches(입력된 pwd, 암호화된 pwd) 를 통하여 비교
		if (loginUser != null && bcryptPasswordEncoder.matches(m.getMemberPwd(), loginUser.getMemberPwd())) {
			// 일치하면 session에 로그인 유저 정보 담기
			session.setAttribute("loginUser", loginUser);
			result = "NNNY";
		}else {
			result = "NNNN";
		}
		
		
		return result;
	}
	
	@GetMapping(value = "logout.me", produces = "text/html; charset=UTF-8")
	public String logoutMember(HttpSession session) {
		session.removeAttribute("loginUser");
		return "redirect:/";
	}

}
