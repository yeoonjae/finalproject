package com.kh.finalproject.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.finalproject.entity.AdminDto;
import com.kh.finalproject.entity.MemberDto;

public class MemberInterceptor extends HandlerInterceptorAdapter {
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler, HttpSession session)
			throws Exception {
		MemberDto memberDto = (MemberDto)session.getAttribute("memberinfo");
		int no=Integer.parseInt(request.getParameter("member_no"));
		if(memberDto.getMember_no()!=no) {
			response.sendRedirect(request.getContextPath()+"/member/account/login");
			return false;
		}else {
			return true;
		}
	}
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}
	
}
