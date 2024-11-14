package com.example.demo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.member.vo.Member;
import com.example.demo.post.model.service.PostService;
import com.example.demo.post.vo.Post;

@Component
public class InteceptorConfig implements HandlerInterceptor {
	
	@Autowired
	PostService postService;	
	// 컨트롤러 가기 전 실행
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		boolean result = true;	
		
		HttpSession session = request.getSession(false);
		
		if(request.getServletPath().equals("/insertPage.po")    ||
			request.getServletPath().equals("/insertPost.po")   ||
			request.getServletPath().equals("/delete.po") 		||
			request.getServletPath().equals("/upDatePost.po")   ||
			request.getServletPath().equals("/insertReply.re")  ||
			request.getServletPath().equals("/deleteReply.re")  ||
			request.getServletPath().equals("/UpdateReply.re") 
				) {
			if(session == null || session.getAttribute("loginUser") == null) { // 로그인 되지
				 response.sendRedirect("/loginPage.me"); 
				 result =  false; 
			}else {
				result =  true; 
			}
		}
		
		
		if(request.getServletPath().equals("/detail.po")) {
			String no = request.getQueryString().substring(request.getQueryString().indexOf("Pno=")+4); 
			
			int Pno = Integer.parseInt(no);
			
			Post p = postService.selectPosrt(Pno);
			
			if(p==null) {
				response.sendRedirect("/NoPost"); 
				 result =  false; 
			}else {
				result =  true; 
			}
			
			
		}
		if(request.getServletPath().equals("/upDatePage.po")) {
			if(session == null || session.getAttribute("loginUser") == null) { // 로그인 되지
				 response.sendRedirect("/loginPage.me"); 
				 result =  false; 
			}else {
				String no = request.getQueryString().substring(request.getQueryString().indexOf("Pno=")+4); 
				int memberNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
				int Pno = Integer.parseInt(no);
				
				Post p = new Post();
				p.setMemberNo(""+memberNo);
				p.setPostNo(Pno);
				
				int checkNo = postService.checkPost(p);
				
				if(checkNo != 1) {
					response.sendRedirect("/NoPost"); 
					 result =  false; 
				}else {
					result =  true; 
				}
			}
			
		}
		if(request.getServletPath().equals("/membership.me")  ||	request.getServletPath().equals("/loginPage.me")) {
				if(session.getAttribute("loginUser") == null) { 
					result =  true; 
				}else {
					 response.sendRedirect("/"); 
					 result =  false;
				}
			}
		
		
		
		return result; 
	}

	// 컨트롤러 처리 끝난 뒤 실행
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		// System.out.println("postHandle");
	}

	// 화면 처리가 끝난 뒤 실행
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
		// System.out.println("afterHandle");
	}

}
