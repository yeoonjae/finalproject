package com.kh.finalproject.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.finalproject.entity.MemberDto;

public class MemberInterceptor extends HandlerInterceptorAdapter{
	@Autowired
	HttpSession session;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		//회원이 로그인 되어있으면
		MemberDto memberDto = (MemberDto)session.getAttribute("memberinfo");
		if(memberDto != null) {
			return true;
		}
		response.sendRedirect(request.getContextPath()+"/member/");
		return false;
	}
}
