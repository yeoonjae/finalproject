package com.kh.finalproject.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.finalproject.entity.AdminDto;

public class TotalAdminInterceptor extends HandlerInterceptorAdapter{

	@Autowired
	HttpSession session;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		//로그인된 사용자가 본사관리자면
		AdminDto adminDto = (AdminDto) session.getAttribute("admininfo");
		if(adminDto.getAdmin_auth().equals("본사")) {
			return true;
		}
		
		response.sendRedirect(request.getContextPath()+"/admin/");
		return false;
	}
}
