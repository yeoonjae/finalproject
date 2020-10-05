package com.kh.finalproject.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.finalproject.entity.AdminDto;

public class AdminInterceptor extends HandlerInterceptorAdapter{
	
	@Autowired
	HttpSession session;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		//관리자가 로그인 되어있다면
		AdminDto adminDto = (AdminDto) session.getAttribute("admininfo");
		if(adminDto != null) {
			return true;
		}else {
			return false;
		}
	}
}
